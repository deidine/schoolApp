import { Routes } from '@angular/router';
import { StudentPlatformComponent } from './student-platform/student-platform.component';
import {AppComponent} from './app.component';
export const routes: Routes = [
  { path: '', redirectTo: '',component: AppComponent ,
    pathMatch: 'full',}, // Redirect default route to '/std'
  { path: 'std', component: StudentPlatformComponent}, // Student Platform route
];
