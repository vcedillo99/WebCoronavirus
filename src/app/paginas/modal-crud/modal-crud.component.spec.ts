import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalCrudComponent } from './modal-crud.component';

describe('ModalCrudComponent', () => {
  let component: ModalCrudComponent;
  let fixture: ComponentFixture<ModalCrudComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ModalCrudComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalCrudComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
