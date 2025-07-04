import mysql.connector
import pandas as pd
import numpy as np
import pickle
from sklearn.ensemble import RandomForestRegressor, RandomForestClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, accuracy_score, classification_report
import warnings
warnings.filterwarnings('ignore')

class StudentAI:
    def __init__(self, host='localhost', user='root', password='', database='student_ai_db'):
        """Initialize connection to MySQL database"""
        self.connection_config = {
            'host': host,
            'user': user,
            'password': password,
            'database': database
        }
        print("Student AI System initialized!")
        self.test_connection()
    
    def test_connection(self):
        """Test database connection"""
        try:
            conn = mysql.connector.connect(**self.connection_config)
            cursor = conn.cursor()
            cursor.execute("SELECT COUNT(*) FROM students")
            student_count = cursor.fetchone()[0]
            cursor.execute("SELECT COUNT(*) FROM student_marks")
            marks_count = cursor.fetchone()[0]
            conn.close()
            print(f"✅ Connected! Found {student_count} students and {marks_count} mark records")
        except Exception as e:
            print(f"❌ Connection failed: {e}")
    
    def load_student_data(self):
        """Load all student data from database"""
        query = """
        SELECT 
            s.student_id,
            s.student_name,
            s.age,
            s.gender,
            s.study_hours_per_week,
            s.attendance_percentage,
            sm.mathematics,
            sm.physics,
            sm.chemistry,
            sm.biology,
            sm.english,
            sm.history,
            sm.geography,
            sm.computer_science
        FROM students s
        JOIN student_marks sm ON s.student_id = sm.student_id
        """
        
        conn = mysql.connector.connect(**self.connection_config)
        df = pd.read_sql(query, conn)
        conn.close()
        
        # Calculate average marks
        subject_columns = ['mathematics', 'physics', 'chemistry', 'biology', 
                          'english', 'history', 'geography', 'computer_science']
        df['average_marks'] = df[subject_columns].mean(axis=1)
        
        # Encode gender
        df['gender_encoded'] = df['gender'].map({'Male': 0, 'Female': 1})
        
        print(f"✅ Loaded data for {len(df)} students")
        return df
    
    def train_performance_predictor(self):
        """Train model to predict student average marks"""
        print("\n🤖 Training Performance Prediction Model...")
        
        # Load data
        df = self.load_student_data()
        
        # Features: age, gender, study_hours, attendance
        X = df[['age', 'gender_encoded', 'study_hours_per_week', 'attendance_percentage']]
        y = df['average_marks']  # Target: average marks
        
        # Split data
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
        
        # Scale features
        scaler = StandardScaler()
        X_train_scaled = scaler.fit_transform(X_train)
        X_test_scaled = scaler.transform(X_test)
        
        # Train model
        model = RandomForestRegressor(n_estimators=100, random_state=42)
        model.fit(X_train_scaled, y_train)
        
        # Test model
        y_pred = model.predict(X_test_scaled)
        rmse = np.sqrt(mean_squared_error(y_test, y_pred))
        
        print(f"✅ Model trained! RMSE: {rmse:.2f}")
        
        # Save model and scaler
        pickle.dump(model, open('performance_model.pkl', 'wb'))
        pickle.dump(scaler, open('performance_scaler.pkl', 'wb'))
        print("✅ Model saved as 'performance_model.pkl' and 'performance_scaler.pkl'")
        
        # Show feature importance
        feature_names = ['Age', 'Gender', 'Study Hours', 'Attendance']
        importance = model.feature_importances_
        print("\n📊 Feature Importance:")
        for name, imp in zip(feature_names, importance):
            print(f"   {name}: {imp:.3f}")
        
        return model, scaler, rmse
    
    def train_risk_classifier(self):
        """Train model to identify at-risk students (average < 75)"""
        print("\n🚨 Training At-Risk Student Classifier...")
        
        # Load data
        df = self.load_student_data()
        
        # Features: age, gender, study_hours, attendance
        X = df[['age', 'gender_encoded', 'study_hours_per_week', 'attendance_percentage']]
        
        # Target: at-risk (average marks < 75)
        y = (df['average_marks'] < 75).astype(int)
        
        print(f"📊 Found {y.sum()} at-risk students out of {len(y)} total")
        
        # Split data
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
        
        # Scale features
        scaler = StandardScaler()
        X_train_scaled = scaler.fit_transform(X_train)
        X_test_scaled = scaler.transform(X_test)
        
        # Train model
        model = RandomForestClassifier(n_estimators=100, random_state=42)
        model.fit(X_train_scaled, y_train)
        
        # Test model
        y_pred = model.predict(X_test_scaled)
        accuracy = accuracy_score(y_test, y_pred)
        
        print(f"✅ Classifier trained! Accuracy: {accuracy:.3f}")
        
        # Save model and scaler
        pickle.dump(model, open('risk_model.pkl', 'wb'))
        pickle.dump(scaler, open('risk_scaler.pkl', 'wb'))
        print("✅ Model saved as 'risk_model.pkl' and 'risk_scaler.pkl'")
        
        # Show classification report
        print("\n📊 Classification Report:")
        print(classification_report(y_test, y_pred, target_names=['Safe', 'At-Risk']))
        
        return model, scaler, accuracy
    
    def predict_student_performance(self, student_ids):
        """Make predictions for specific students"""
        print(f"\n🔮 Making predictions for students: {student_ids}")
        
        try:
            # Load models
            performance_model = pickle.load(open('performance_model.pkl', 'rb'))
            performance_scaler = pickle.load(open('performance_scaler.pkl', 'rb'))
            risk_model = pickle.load(open('risk_model.pkl', 'rb'))
            risk_scaler = pickle.load(open('risk_scaler.pkl', 'rb'))
            print("✅ Models loaded successfully")
        except FileNotFoundError:
            print("❌ Models not found! Please train models first.")
            return None
        
        # Get student data from database
        placeholders = ','.join(['%s'] * len(student_ids))
        query = f"""
        SELECT 
            student_id, student_name, age, gender, 
            study_hours_per_week, attendance_percentage
        FROM students 
        WHERE student_id IN ({placeholders})
        """
        
        conn = mysql.connector.connect(**self.connection_config)
        df = pd.read_sql(query, conn, params=student_ids)
        conn.close()
        
        if len(df) == 0:
            print("❌ No students found with given IDs")
            return None
        
        # Prepare features
        df['gender_encoded'] = df['gender'].map({'Male': 0, 'Female': 1})
        X = df[['age', 'gender_encoded', 'study_hours_per_week', 'attendance_percentage']]
        
        # Make predictions
        X_scaled_perf = performance_scaler.transform(X)
        X_scaled_risk = risk_scaler.transform(X)
        
        predicted_marks = performance_model.predict(X_scaled_perf)
        risk_predictions = risk_model.predict(X_scaled_risk)
        risk_probabilities = risk_model.predict_proba(X_scaled_risk)[:, 1]
        
        # Create results dataframe
        results = df[['student_id', 'student_name', 'age', 'gender', 'study_hours_per_week', 'attendance_percentage']].copy()
        results['predicted_average_marks'] = predicted_marks.round(2)
        results['at_risk'] = risk_predictions.astype(bool)
        results['risk_probability'] = risk_probabilities.round(3)
        
        print("✅ Predictions completed!")
        return results
    
    def analyze_subject_difficulty(self):
        """Analyze which subjects are most difficult"""
        print("\n📊 Analyzing Subject Difficulty...")
        
        query = """
        SELECT 
            mathematics, physics, chemistry, biology,
            english, history, geography, computer_science
        FROM student_marks
        """
        
        conn = mysql.connector.connect(**self.connection_config)
        df = pd.read_sql(query, conn)
        conn.close()
        
        # Calculate statistics for each subject
        subject_stats = df.describe().round(2)
        
        # Calculate failure rates (< 60 marks)
        failure_rates = (df < 60).mean() * 100
        
        print("📈 Subject Statistics:")
        print(subject_stats.loc[['mean', 'std', 'min', 'max']])
        
        print(f"\n🚨 Failure Rates (< 60 marks):")
        for subject, rate in failure_rates.items():
            print(f"   {subject}: {rate:.1f}%")
        
        # Find easiest and hardest subjects
        easiest = df.mean().idxmax()
        hardest = df.mean().idxmin()
        print(f"\n🟢 Easiest Subject: {easiest} (avg: {df.mean()[easiest]:.1f})")
        print(f"🔴 Hardest Subject: {hardest} (avg: {df.mean()[hardest]:.1f})")
        
        return subject_stats, failure_rates
    
    def get_top_students(self, n=10):
        """Get top performing students"""
        print(f"\n🏆 Top {n} Students:")
        
        df = self.load_student_data()
        top_students = df.nlargest(n, 'average_marks')[['student_name', 'average_marks', 'study_hours_per_week', 'attendance_percentage']]
        
        for i, (_, student) in enumerate(top_students.iterrows(), 1):
            print(f"   {i:2d}. {student['student_name']:20} - Avg: {student['average_marks']:.1f} "
                  f"(Study: {student['study_hours_per_week']}h, Attendance: {student['attendance_percentage']:.1f}%)")
        
        return top_students
    
    def find_at_risk_students(self):
        """Find students who need help"""
        print("\n🚨 Students At Risk (Average < 75):")
        
        df = self.load_student_data()
        at_risk = df[df['average_marks'] < 75].sort_values('average_marks')[
            ['student_name', 'average_marks', 'study_hours_per_week', 'attendance_percentage']
        ]
        
        if len(at_risk) == 0:
            print("   🎉 No students at risk!")
        else:
            for _, student in at_risk.iterrows():
                print(f"   • {student['student_name']:20} - Avg: {student['average_marks']:.1f} "
                      f"(Study: {student['study_hours_per_week']}h, Attendance: {student['attendance_percentage']:.1f}%)")
        
        return at_risk
    
    def demo_workflow(self):
        """Demonstrate complete AI workflow"""
        print("=" * 60)
        print("🎓 STUDENT AI SYSTEM - COMPLETE DEMO")
        print("=" * 60)
        
        # 1. Load and analyze data
        print("\n1️⃣ DATA ANALYSIS")
        self.analyze_subject_difficulty()
        self.get_top_students(5)
        self.find_at_risk_students()
        
        # 2. Train AI models
        print("\n2️⃣ AI MODEL TRAINING")
        self.train_performance_predictor()
        self.train_risk_classifier()
        
        # 3. Make predictions
        print("\n3️⃣ AI PREDICTIONS")
        # Test with first 5 students
        results = self.predict_student_performance([1, 2, 3, 4, 5])
        if results is not None:
            print("\n📋 Prediction Results:")
            print(results[['student_name', 'predicted_average_marks', 'at_risk', 'risk_probability']].to_string(index=False))
        
        print("\n" + "=" * 60)
        print("✅ DEMO COMPLETE! Models saved as .pkl files")
        print("=" * 60)

# Example usage and testing
if __name__ == "__main__":
    # Initialize the AI system
    # UPDATE THESE CREDENTIALS FOR YOUR MYSQL SETUP
    ai = StudentAI(
        host='localhost',
        user='root',        # Your MySQL username
        password='',        # Your MySQL password
        database='student_ai_db'
    )
    
    # Run complete demo
    ai.demo_workflow()
    
    # You can also run individual functions:
    
    # Just train performance model
    # ai.train_performance_predictor()
    
    # Just train risk classifier
    # ai.train_risk_classifier()
    
    # Make predictions for specific students
    # results = ai.predict_student_performance([10, 20, 30])
    # print(results)
    
    # Analyze subjects
    # ai.analyze_subject_difficulty()
    
    # Find top students
    # ai.get_top_students(10)