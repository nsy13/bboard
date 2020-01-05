import { Component, OnInit } from '@angular/core';
import { Topic, TOPICS } from '../topics/topic';
import { ActivatedRoute } from '@angular/router';
import { TopicService } from '../topic.service';

@Component({
  selector: 'app-topic-detail',
  templateUrl: './topic-detail.component.html',
  styleUrls: ['./topic-detail.component.scss']
})
export class TopicDetailComponent implements OnInit {
  topics: Topic[];
  topic: Topic;

  constructor(
    private topicService: TopicService,
    private route: ActivatedRoute
  ) { }

  ngOnInit() {
    this.getTopics();
    this.route.paramMap.subscribe(params => {
      this.topic = this.topics[+params.get('id')]
    });
  }

  getTopics() {
    this.topicService.getTopics().subscribe(
      data => this.topics = data[1]
    )
  }
}
