import { Component, OnInit } from '@angular/core';
import { Topic } from './topic';

@Component({
  selector: 'app-topics',
  templateUrl: './topics.component.html',
  styleUrls: ['./topics.component.scss']
})
export class TopicsComponent implements OnInit {
  topics: Topic[] = [
    { name: "Ruby Gemについて語るスレ" },
    { name: "Railsファンの集い" },
    { name: "プログラミング初心者スレ" },
    { name: "未経験から転職する方法まとめ" },
    { name: "Ruby Gemについて語るスレ" },
    { name: "Railsファンの集い" },
    { name: "プログラミング初心者スレ" },
    { name: "未経験から転職する方法まとめ" },
    { name: "Ruby Gemについて語るスレ" },
    { name: "Railsファンの集い" },
    { name: "プログラミング初心者スレ" },
    { name: "未経験から転職する方法まとめ" },
    { name: "Angular勉強会" },
  ]
  constructor() { }

  ngOnInit() {
  }

}
