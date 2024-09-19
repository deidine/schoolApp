import { Routes } from '@angular/router';
import { StudentPlatformComponent } from './student-platform/student-platform.component';
import {AppComponent} from './app.component';
import { HomeComponent } from './home/home.component';
import { GradesComponent } from './grades/grades.component';
import { CalanderComponent } from './calander/calander.component';
export const routes: Routes = [
  { path: 'home', component: HomeComponent , pathMatch: 'full',}, // Redirect default route to '/std'
  // Redirect default route to '/std'
  { path: 'std', component: StudentPlatformComponent}, 
  { path: 'grade', component: GradesComponent}, 
  { path: 'calander', component: CalanderComponent}, 
];
