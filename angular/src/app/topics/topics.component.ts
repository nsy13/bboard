import { Component, OnInit } from '@angular/core';
import { Topic, TOPICS } from './topic';
import { TopicService } from '../topic.service';

@Component({
  selector: 'app-topics',
  templateUrl: './topics.component.html',
  styleUrls: ['./topics.component.scss']
})
export class TopicsComponent implements OnInit {
  topics: Topic[];
  constructor(private topicService: TopicService) { }

  ngOnInit() {
    this.getTopics()
  }

  getTopics() {
    this.topicService.getTopics().subscribe(
      data => this.topics = data[1]
    )
  }

}
