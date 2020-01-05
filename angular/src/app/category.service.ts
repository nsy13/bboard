import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Category } from './categories/category';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  categoryApiUrl = "http://localhost:3000"

  constructor(private http: HttpClient) { }

  getCategories(): Observable<Category[]> {
    return this.http.get<Category[]>(this.categoryApiUrl)
  }
}
