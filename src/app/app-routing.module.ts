import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from "./paginas/login/login.component";
import { PrincipalComponent } from './paginas/principal/principal.component';
import { CiudadanosComponent } from './paginas/ciudadanos/ciudadanos.component';


const routes: Routes = [
  {
    path: '', redirectTo: '/app-login', pathMatch: 'full' 
  },
  {
    path: 'app-login', component: LoginComponent
  },
  {
    path: 'app-principal', component: PrincipalComponent
  },
  {
    path: 'app-ciudadanos', component: CiudadanosComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
