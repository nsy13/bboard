import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Category } from './categories/category';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  categoriesApiUrl = "http://localhost:3000"

  constructor(private http: HttpClient) { }

  getCategories(): Observable<any> {
    return this.http.get(this.categoriesApiUrl)
  }
}
