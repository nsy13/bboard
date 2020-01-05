import { Component, OnInit } from '@angular/core';
import { Topic, TOPICS } from './topic';

@Component({
  selector: 'app-topics',
  templateUrl: './topics.component.html',
  styleUrls: ['./topics.component.scss']
})
export class TopicsComponent implements OnInit {
  topics: Topic[] = TOPICS;
  constructor() { }

  ngOnInit() {
  }

}
