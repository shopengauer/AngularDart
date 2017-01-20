// Copyright (c) 2017, vasiliy. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:AngularDart/hello_dialog/hello_dialog.dart';



@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  template: '''<h1>{{title}}</h1>
               <h2>Current word is {{word.englishWord}}</h2>
               <div>
                Слово: <input [(ngModel)]="word.englishWord" placeholder="English word"/>
                Перевод: <input #box (keyup.enter) = "addTranslateWord(box.value)" placeholder="Русский перевод"/>
                         <button type="button" (click)="addTranslateWord(box.value)">Добавить</button>
                         <button >Сохранить карточку</button>
               </div>
               <div>
                  <h3>List of translates words</h3>
                  <ul>
                    <li *ngFor="let item of word.listOfTranslates">
                      {{item}}
                    </li>
                  </ul>
               </div>


  ''',
  directives: const [materialDirectives],
  providers: const [materialProviders],
)
class AppComponent {
  String title = 'English cards';
  Word word = new Word('emerge',['появляться','возникать']);


  // Nothing here yet. All logic is in HelloDialog.
  void addTranslateWord(String translateWord){
    word.addTranslateWord(translateWord);
  }

}

class Word {

  String englishWord;
  List<String> listOfTranslates;

  Word(this.englishWord,this.listOfTranslates);

  void addTranslateWord(String translateWord){
    listOfTranslates.add(translateWord);
    print(listOfTranslates);
  }




}
