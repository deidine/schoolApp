import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { GradesComponent } from './grades/grades.component';
import { CalanderComponent } from './calander/calander.component';
export const routes: Routes = [
  { path: 'home', component: HomeComponent , pathMatch: 'full',}, 
  { path: 'grade', component: GradesComponent}, 
  { path: 'calander', component: CalanderComponent}, 
];
