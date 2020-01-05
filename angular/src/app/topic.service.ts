import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TopicService {
  topicsApiUrl = "http://localhost:3000";
  constructor(private http: HttpClient) { }

  getTopics(): Observable<any> {
    return this.http.get(this.topicsApiUrl)
  }
}
