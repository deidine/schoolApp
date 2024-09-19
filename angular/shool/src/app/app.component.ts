import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // Import FormsModule
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,FormsModule, CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'shool';
  successStats = [
    { icon: 'bi-person', value: '15K+', label: 'Number Of Students' },
    { icon: 'bi-graph-up', value: '75%', label: 'Percentage Of Success' },
    { icon: 'bi-question-circle', value: '35', label: 'Numbers Of Questions' },
    { icon: 'bi-people', value: '25+', label: 'Number Of Experts' },
    { icon: 'bi-star', value: '15+', label: 'Years Of Experience' }
  ];

  howItWorks = [
    { title: 'Sign Up', description: 'Morbia Vhamus Curve Quisque Et Primis Praesent' },
    { title: 'Get access', description: 'Morbia Vhamus Curve Quisque Et Primis Praesent Nullam' },
    { title: 'Practice questions', description: 'Prepare For The MLA Exam In Multiple Modes Of Revision And Track Your Progress With Your Personalized Dashboard' },
    { title: 'Get Result', description: 'Compare Your Results With Your Peers With Advanced Analytics' }
  ];

  onSubmit(form: any) {
    console.log('Form submitted', form);
    // Handle form submission
  }
}
