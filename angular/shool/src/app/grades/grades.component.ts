import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
 

interface Grade {
 subject: string;
 grade: string;
 credits: number;
}

@Component({
  selector: 'app-grades',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './grades.component.html',
  styleUrl: './grades.component.css'
})
export class GradesComponent implements OnInit {
  studentName: string = 'Sidi Ali';
  studentId: string = '12345';
  semester: string = 'Simestre 2023';
  grades: Grade[] = [
    { subject: 'Math', grade: '16', credits: 4 },
    { subject: 'English', grade: '17', credits: 3 },
    { subject: 'Physics', grade: '8', credits: 4 },
    { subject: 'History/Geography', grade: '20', credits: 3 },
    { subject: 'Computer Science', grade: '20', credits: 4 }
  ];

  gpa: number = 0;

  ngOnInit() {
    this.calculateTotal();
  }

  calculateTotal() {
    const gradePoints = {
      'A+': 4.0, 'A': 4.0, 'A-': 3.7,
      'B+': 3.3, 'B': 3.0, 'B-': 2.7,
      'C+': 2.3, 'C': 2.0, 'C-': 1.7,
      'D+': 1.3, 'D': 1.0, 'F': 0.0
    };

    let totalPoints = 0;
    let totalCredits = 0;

    this.grades.forEach(grade => {
      totalPoints += parseInt( grade.grade)  * grade.credits;
      totalCredits += grade.credits;
    });

    this.gpa = totalPoints / totalCredits;
  }
}