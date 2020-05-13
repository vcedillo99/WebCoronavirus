import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';

interface Nacionalidad {
  value: string;
  viewValue: string;
}

interface Infeccion {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-modal-crud',
  templateUrl: './modal-crud.component.html',
  styleUrls: ['./modal-crud.component.css']
})
export class ModalCrudComponent implements OnInit {

  modalForm: FormGroup;

  nacion: Nacionalidad[] = [
    {value: 'peruana', viewValue: 'Peruana'},
    {value: 'venezonala', viewValue: 'Venezonala'},
    {value: 'española', viewValue: 'Española'},
    {value: 'italiana', viewValue: 'Italiana'}
  ];

  infeccion: Infeccion[] = [
    {value: 'infectado', viewValue: 'Infectado'},
    {value: 'no-infectado', viewValue: 'No infectado'},
    {value: 'en-revision', viewValue: 'En revisión'}
  ];

  constructor(
    private formBuilder: FormBuilder
  ) { }

  ngOnInit(): void {
    this.modalForm = this.formBuilder.group({});
  }

}
