import 'dart:io';

import 'package:beautifulsoup/beautifulsoup.dart';
import 'package:http/http.dart' as http;

void sampleCode1() async {
  var url = 'https://example.com/whatsit/create';
  var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(await http.read('https://example.com/foobar.txt'));
}

/// -------------------------------------------------------------

List<String> labels = [
  'リクエスト', 'こども', '職業', 'ポーズ', '病気', 'お金', '会社', '違反', 'ビジネス', '道具', '学校', '食べ物', '事故', 'ファッション', '趣味', '医療', 'スポーツ', '建物', 'スイーツ', 'おもちゃ', '旅行', '家電', '家族', 'キャラクター', '文字', '料理', '動物キャラ', '機械', '日本', 'マーク', '車', '音楽', '老人', '飲み物', 'パーティ', '家具', '若者', 'コンピューター', '医療機器', 'マナー', '乗り物', 'ショッピング', 'スマートフォン', '動物', '友達', '食事', '生活', '夏', '魚', 'インターネット', '野菜', '軽食', '災害', '受験', '恋愛', '冬', '美術', '表情', '人体', '運動', '似顔絵', '戦争', 'ペット', '掃除', '世界', '睡眠', '美容', 'お正月', '本', '科学', '風景', '就活', '犬', '虫', '花', 'あかちゃん', 'ファンタジー', '鳥', '植物', '海', '食材', 'フルーツ', '文房具', 'お年賀状', '物語', '猫', '介護', 'ウェディング', '南国', '調味料', 'お風呂', 'ランドマーク', '引越し', 'クリスマス', '環境問題', 'テンプレート', 'スポーツ用具', '中年', '夏休み', '怪我', '髪', 'メディア', '座布団', '書類', '干支', '食器', '政治', 'お祭り', '電車', '宗教', 'ゴミ', '幼稚園', '楽器', 'エネルギー', 'パン', '映画', 'オリンピック', 'メッセージ', '飾り', '農業', '自転車', 'お寿司', '食べ物キャラ', 'ダンス', '体育', 'POP', 'お葬式', '思い出', '周辺機器', 'メタボリック', '棒人間', '梅雨', '歯', '春', '集合', 'お誕生日', '英語', '運動会', 'サッカー', 'カフェ', 'バレンタイン', '宇宙', '室内', '野球', '秋', '吹奏楽', '歌', '卒業式', 'フレーム', '爬虫類両生類', '健康診断', 'トイレ', 'ぴょこ', '新社会人', 'ハロウィン', 'ライン', 'お弁当', '文化祭', 'ゴールデンウィーク', '天気', '深海', '古代生物', '漁業', '洗濯', '夏バテ', 'あいさつ', '貝', '人体キャラ', '地図', '裁縫', 'こども職業', 'お花見', '甲殻類', '年の瀬', '世代', '仏像', '新学期', '地域キャラ', '花火', 'スープ', '入学式', '初詣', '音楽家', '紅葉', 'こどもの日', '林業', '恐竜', '給食', '父の日', '忘年会', 'VR', '忍者', '祝日', '人工知能', '節分', '母の日', 'LGBT', 'クジライルカ', '書道', 'ペンギン', 'ヨガ', '乗り物キャラ', '大晦日', 'パラリンピック', '動物の顔', '日焼け', 'ホワイトデー', '七夕', 'おにぎり', '陸上', '暑中見舞い', '星座', '成人式', '敬老の日', '野菜の切り方', 'ひな祭り', 'お月見', 'パターン', '伝言メモ', '顔アイコン', 'LINEスタンプ', 'イースター', '勤労感謝の日', 'ゆめかわ', '国旗', '一筆箋', 'トランプ', '七五三', 'メッセージカード', '書体', 'エイプリルフール', '禁止', '国旗まとめ', 'ペンキ書体', '宣伝', '白抜き書体', 
];

// Beautifulsoup 使用教學: https://pub.dev/packages/beautifulsoup
void practice01() async {
  var path = Directory.current.path + '\\others\\images\\';
  int currentPageIndex;

  var hasNextPage = false;
  List<String> linkData;

  labels.forEach((label) async {
    var url = 'https://www.irasutoya.com/search/label/$label';

    currentPageIndex = 0;

    while (true) {
      print('---------------------------------------------');
      linkData = [];
      hasNextPage = false;

      currentPageIndex++;
      var response = await http.get(url);

      print('[DEBUG] 目前是第${currentPageIndex}頁: Response status: ${response.statusCode}');

      var soup = Beautifulsoup(response.body);

      var hrefs = soup.find_all('a').map((a) => a.attributes['href']).toList();

      hrefs.forEach((href) {
        if (RegExp('irasutoya.*blog-post.*html\$').hasMatch(href)) {
          if (!linkData.contains(href)) linkData.add(href);
        } else if (RegExp('max-results=20&start=${20 * currentPageIndex}&by-date=false').hasMatch(href)) {
          url = href;
          hasNextPage = true;
        }
      });

      print('[DEBUG] 找到幾${linkData.length}張圖片');

      linkData.forEach((link) async {
        var _res = await http.get(link);
        var _soup = Beautifulsoup(_res.body);
        // .separatoe a
        var _imageLinks = _soup.find_all('a')
        .where((e) {
          var _href = e.attributes['href'];
          if (_href == null) return false;
          return RegExp('.*\/(.*png|.*jpg)\$').hasMatch(_href);
        })
        .map((e) {
          if (!e.attributes['href'].startsWith('https:')) {
            return 'https:' + e.attributes['href'];  
          }
          return e.attributes['href'];
        }).toList();

        _imageLinks.forEach((imageLink) async {
          var filename = RegExp('.*\/(.*png|.*jpg)\$').firstMatch(imageLink).group(1);
          await http.get(imageLink).then((res) async {
            await File(path + filename).writeAsBytes(res.bodyBytes);
          });
        });
      });

      if (!hasNextPage) {
        break;
      }
    }
  });

  

}