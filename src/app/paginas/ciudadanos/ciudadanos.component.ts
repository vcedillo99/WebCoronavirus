import { Component, OnInit } from '@angular/core';
import { MatDialog } from "@angular/material/dialog";
import { ModalCrudComponent } from '../modal-crud/modal-crud.component';

export interface PeriodicElement {
  position: number;
  name: string;
  dni: number;
  celular: number;
  nacionalidad: string;
  estado_infeccion: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Hernan Flores Gomez', dni: 76352637, nacionalidad: 'Peruana', celular: 97657432, estado_infeccion: 'No infectado'},
  {position: 2, name: 'Cecilia Galvez Morales', dni: 42563547, nacionalidad: 'Peruana', celular: 97657432, estado_infeccion: 'No infectado'},
  {position: 3, name: 'Pedro Arias Sulca', dni: 47263748, nacionalidad: 'Venezonalana', celular: 97657432, estado_infeccion: 'En revisión'},
  {position: 4, name: 'José Perez Aguilar', dni: 71263847, nacionalidad: 'Peruana', celular: 97657432, estado_infeccion: 'Infectado'},
  {position: 5, name: 'Jesús Cedillo Aguilar', dni: 87643454, nacionalidad: 'Peruana', celular: 97657432, estado_infeccion: 'Infectado'},
  {position: 6, name: 'Jefferson Morales Rivera', dni: 65234726, nacionalidad: 'Peruana', celular: 97657432, estado_infeccion: 'Infectado'},
  {position: 7, name: 'Christian Sosa Condori', dni: 48126378, nacionalidad: 'Peruana', celular: 97657432, estado_infeccion: 'Infectado'},
  {position: 8, name: 'Augusto Saavedra Moltalvan', dni: 79346523, nacionalidad: 'Española', celular: 97657432, estado_infeccion: 'En revision'},
  {position: 9, name: 'Noemi Flores Martel', dni: 76489164, nacionalidad: 'Italiana', celular: 97657432, estado_infeccion: 'Infectado'},
  {position: 10, name: 'Estrella Huaman Gonzales', dni: 49386254, nacionalidad: 'Peruana', celular: 97657432, estado_infeccion: 'No infectado'},
];

@Component({
  selector: 'app-ciudadanos',
  templateUrl: './ciudadanos.component.html',
  styleUrls: ['./ciudadanos.component.css']
})
export class CiudadanosComponent implements OnInit {

  displayedColumns: string[] = ['position', 'name', 'dni', 'celular', 'nacionalidad', 'estado_infeccion', 'editar', 'eliminar'];
  dataSource = ELEMENT_DATA;

  constructor(
    private dialog: MatDialog
  ) { }

  ngOnInit(): void {
    
  }

  abrirDialog(){
    this.dialog.open(ModalCrudComponent, {
      width: '300px'
    });
  }

}
