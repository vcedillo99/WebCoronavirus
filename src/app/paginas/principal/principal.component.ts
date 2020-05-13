import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-principal',
  templateUrl: './principal.component.html',
  styleUrls: ['./principal.component.css']
})
export class PrincipalComponent implements OnInit {

  paginas: any;

  constructor() { }

  ngOnInit(): void {
  }

  pagina(pagina){
    switch (pagina) {
      case 'ciudadano':
        this.paginas = 'ciudadano'
        break;
    
      default:
        this.paginas = 'ciudadano'
        break;
    }
  }

}
