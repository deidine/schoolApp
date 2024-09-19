import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

interface CalendarEvent {
  date: Date;
  title: string;
  description: string;
  type: 'academic' | 'extracurricular' | 'holiday';
}

@Component({
  selector: 'app-calander',
  standalone: true,
  imports: [CommonModule],
  
  templateUrl: './calander.component.html',
  styleUrl: './calander.component.css'
})
export class CalanderComponent {

   currentMonth: Date = new Date();
  events: CalendarEvent[] = [
    { date: new Date(2023, 8, 5), title: 'First Day of Classes', description: 'Fall semester begins', type: 'academic' },
    { date: new Date(2023, 8, 15), title: 'Club Fair', description: 'Join student organizations', type: 'extracurricular' },
    { date: new Date(2023, 9, 10), title: 'Midterm Exams Begin', description: 'Prepare for your exams', type: 'academic' },
    { date: new Date(2023, 10, 11), title: 'Veterans Day', description: 'No classes', type: 'holiday' },
    { date: new Date(2023, 10, 23), title: 'Thanksgiving Break', description: 'No classes', type: 'holiday' },
  ];

  weeks: Date[][] = [];

  ngOnInit() {
    this.generateCalendar();
  }

  generateCalendar() {
    const firstDay = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth(), 1);
    const lastDay = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() + 1, 0);

    const startDate = new Date(firstDay);
    startDate.setDate(startDate.getDate() - startDate.getDay());

    const endDate = new Date(lastDay);
    endDate.setDate(endDate.getDate() + (6 - endDate.getDay()));

    this.weeks = [];
    let currentWeek: Date[] = [];

    for (let d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
      currentWeek.push(new Date(d));
      if (currentWeek.length === 7) {
        this.weeks.push(currentWeek);
        currentWeek = [];
      }
    }
  }

  getEventsForDate(date: Date): CalendarEvent[] {
    return this.events.filter(event => 
      event.date.getDate() === date.getDate() &&
      event.date.getMonth() === date.getMonth() &&
      event.date.getFullYear() === date.getFullYear()
    );
  }

  prevMonth() {
    this.currentMonth = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() - 1);
    this.generateCalendar();
  }

  nextMonth() {
    this.currentMonth = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() + 1);
    this.generateCalendar();
  }
}