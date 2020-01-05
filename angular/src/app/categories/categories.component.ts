import { Component, OnInit } from '@angular/core';
import { Category } from './category';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.scss']
})
export class CategoriesComponent implements OnInit {
  categories: Category[] = [
    { name: "Ruby" },
    { name: "Angular" },
    { name: "Vue.js" },
    { name: "Python" },
    { name: "React" }
  ]
  constructor() { }

  ngOnInit() {
  }

}
