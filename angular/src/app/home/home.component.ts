import { Component, OnInit } from '@angular/core';

export interface Tile {
  color: string;
  cols: number;
  rows: number;
  text: string;
}

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  tiles: Tile[] = [
    {text: 'space1', cols: 1, rows: 1, color: 'lightblue'},
    {text: 'leftSection', cols: 2, rows: 1, color: 'lightgreen'},
    {text: 'space2', cols: 1, rows: 1, color: 'lightpink'},
    {text: 'rightSection', cols: 8, rows: 1, color: '#DDBDF1'},
  ];
  constructor() { }

  ngOnInit() {
  }

}