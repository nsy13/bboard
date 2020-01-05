import { Component, OnInit } from '@angular/core';
import { Topic, TOPICS } from '../topics/topic';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-topic-detail',
  templateUrl: './topic-detail.component.html',
  styleUrls: ['./topic-detail.component.scss']
})
export class TopicDetailComponent implements OnInit {
  topics: Topic[] = TOPICS;
  topic: Topic;

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      this.topic = this.topics[+params.get('id')]
    })
  }

}
