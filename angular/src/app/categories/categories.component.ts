import { Component, OnInit } from '@angular/core';
import { Category, CATEGORIES } from './category';
import { CategoryService } from '../category.service';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.scss']
})
export class CategoriesComponent implements OnInit {
  categories: Category[];
  constructor(private categoryService: CategoryService) { }

  ngOnInit() {
    this.getCategories()
  }

  getCategories() {
    this.categoryService.getCategories().subscribe(
      data => this.categories = data[0]
    )
  }

}
