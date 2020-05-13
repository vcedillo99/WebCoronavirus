import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from "./material.module";
import { LoginComponent } from './paginas/login/login.component';
import { ReactiveFormsModule } from '@angular/forms';
import { PrincipalComponent } from './paginas/principal/principal.component';
import { CiudadanosComponent } from './paginas/ciudadanos/ciudadanos.component';
import { ModalCrudComponent } from './paginas/modal-crud/modal-crud.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    PrincipalComponent,
    CiudadanosComponent,
    ModalCrudComponent
  ],
  entryComponents: [
    ModalCrudComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
