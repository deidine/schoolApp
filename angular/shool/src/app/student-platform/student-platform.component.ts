import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
 

@Component({
  selector: 'app-student-platform',
  standalone: true, // This component is a standalone component
  imports: [CommonModule], // Import CommonModule to enable Angular directives like ngIf and ngFor
  templateUrl: './student-platform.component.html',
  styleUrl :  './student-platform.component.css'  // Fix typo (styleUrls instead of styleUrl)
})
export class StudentPlatformComponent {
  supportForm = {
    name: '',
    email: '',
    phone: '',
    query: ''
  };

  newsletterEmail: string = '';

  onSubmit() {
    // Handle support form submission
    console.log('Support form submitted:', this.supportForm);
    // Reset form after submission
    this.supportForm = {
      name: '',
      email: '',
      phone: '',
      query: ''
    };
  }

  onNewsletterSubmit() {
    // Handle newsletter subscription
    console.log('Newsletter subscription:', this.newsletterEmail);
    // Reset email after submission
    this.newsletterEmail = '';
  }
}
