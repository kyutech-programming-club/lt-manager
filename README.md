# LT-Manager
**LT会管理アプリ**
![image](https://user-images.githubusercontent.com/49225560/61857709-a040b700-aeff-11e9-9302-5ffbbf443770.png)

##　LT-Managerとは
九工大プロ研内で行われる  
LT(Lightning Talks)会管理アプリです。

##　機能

![image](https://user-images.githubusercontent.com/49225560/61860995-ec8ef580-af05-11e9-8dce-06cb80e60297.png)
ヘッダーからジャンプできるページ
- 陰キャ(ユーザー)一覧  
- LT一覧
- マイページ
- login/logout
- 文句はこちら(意見投稿フォーム)

####　陰キャ(ユーザー)一覧
![image](https://user-images.githubusercontent.com/49225560/61859802-ccf6cd80-af03-11e9-85a1-6fea1417f415.png)
LT-Managerに登録しているユーザーの一覧が表示されます。

####　マイページ
![image](https://user-images.githubusercontent.com/49225560/61860659-46db8680-af05-11e9-9685-c0dde925a80c.png)
ユーザーの一言、発表一覧が表示されます。  
右のアイコンから名前・一言の編集が可能です。

####　LT一覧
![image](https://user-images.githubusercontent.com/49225560/61861663-58be2900-af07-11e9-90cd-e3f7c4dd2e40.png)
開催中、開催予定、開催済みの一覧が表示されます。  
新規作成が可能です。

実際にLTの1つにジャンプすると次のように表示されます。
![image](https://user-images.githubusercontent.com/49225560/61862453-e2bac180-af08-11e9-84ec-accd064aafcf.png)
発表一覧と参加するだけの人の一覧が表示されます。  
また「参加する」を押すとこのイベントに参加することが可能です。  
実際に押すと次のように表示されます。
![image](https://user-images.githubusercontent.com/49225560/61853202-45ef2880-aef6-11e9-840d-7137a50d9f70.png)  
赤いアイコンから右に、参加をやめる、発表順をシャッフル(管理者ツール)、イベント編集が可能です。  
また、発表一覧の下の「＋」で発表の新規作成が可能です。  

自分の発表のタイトルを押すと次のように表示されます。
![image](https://user-images.githubusercontent.com/49225560/61860553-201d5000-af05-11e9-97f5-b683e2d84f3e.png) 
右の青いアイコンで、発表タイトル・「スライド」のURL・「動画」のURLの編集、その右のアイコンで発表の削除が可能です。

また、自分以外の発表のタイトルを押すと次のように表示されます。
![image](https://user-images.githubusercontent.com/49225560/61863857-62e22680-af0b-11e9-9a45-0b206522c680.png)
この発表に対する感想の投稿が可能です。

##Requirement
- Rails 5.2.3
- Ruby 2.4.1

##開発者
柴田　光希
