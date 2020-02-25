import 'dart:io';

import 'package:beautifulsoup/beautifulsoup.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void sampleCode1() async {
  var url = 'https://example.com/whatsit/create';
  var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(await http.read('https://example.com/foobar.txt'));
}

/// -------------------------------------------------------------

List<String> labels = [
  // 'リクエスト', 'こども', '職業', 'ポーズ', '病気', 'お金', '会社', 
  // '違反', 'ビジネス', '道具', '学校', 
  // '食べ物', '事故', 'ファッション', '趣味', '医療', 'スポーツ', '建物', 'スイーツ', 'おもちゃ', '旅行', '家電', '家族', 
  'キャラクター', '文字', '料理', '動物キャラ', '機械', '日本', 'マーク', '車', '音楽', '老人', '飲み物', 'パーティ', '家具', '若者', 'コンピューター', '医療機器', 'マナー', '乗り物', 'ショッピング', 'スマートフォン', '動物', '友達', '食事', '生活', '夏', '魚', 'インターネット', '野菜', '軽食', '災害', '受験', '恋愛', '冬', '美術', '表情', '人体', '運動', '似顔絵', '戦争', 'ペット', '掃除', '世界', '睡眠', '美容', 'お正月', '本', '科学', '風景', '就活', '犬', '虫', '花', 'あかちゃん', 'ファンタジー', '鳥', '植物', '海', '食材', 'フルーツ', '文房具', 'お年賀状', '物語', '猫', '介護', 'ウェディング', '南国', '調味料', 'お風呂', 'ランドマーク', '引越し', 'クリスマス', '環境問題', 'テンプレート', 'スポーツ用具', '中年', '夏休み', '怪我', '髪', 'メディア', '座布団', '書類', '干支', '食器', '政治', 'お祭り', '電車', '宗教', 'ゴミ', '幼稚園', '楽器', 'エネルギー', 'パン', '映画', 'オリンピック', 'メッセージ', '飾り', '農業', '自転車', 'お寿司', '食べ物キャラ', 'ダンス', '体育', 'POP', 'お葬式', '思い出', '周辺機器', 'メタボリック', '棒人間', '梅雨', '歯', '春', '集合', 'お誕生日', '英語', '運動会', 'サッカー', 'カフェ', 'バレンタイン', '宇宙', '室内', '野球', '秋', '吹奏楽', '歌', '卒業式', 'フレーム', '爬虫類両生類', '健康診断', 'トイレ', 'ぴょこ', '新社会人', 'ハロウィン', 'ライン', 'お弁当', '文化祭', 'ゴールデンウィーク', '天気', '深海', '古代生物', '漁業', '洗濯', '夏バテ', 'あいさつ', '貝', '人体キャラ', '地図', '裁縫', 'こども職業', 'お花見', '甲殻類', '年の瀬', '世代', '仏像', '新学期', '地域キャラ', '花火', 'スープ', '入学式', '初詣', '音楽家', '紅葉', 'こどもの日', '林業', '恐竜', '給食', '父の日', '忘年会', 'VR', '忍者', '祝日', '人工知能', '節分', '母の日', 'LGBT', 'クジライルカ', '書道', 'ペンギン', 'ヨガ', '乗り物キャラ', '大晦日', 'パラリンピック', '動物の顔', '日焼け', 'ホワイトデー', '七夕', 'おにぎり', '陸上', '暑中見舞い', '星座', '成人式', '敬老の日', '野菜の切り方', 'ひな祭り', 'お月見', 'パターン', '伝言メモ', '顔アイコン', 'LINEスタンプ', 'イースター', '勤労感謝の日', 'ゆめかわ', '国旗', '一筆箋', 'トランプ', '七五三', 'メッセージカード', '書体', 'エイプリルフール', '禁止', '国旗まとめ', 'ペンキ書体', '宣伝', '白抜き書体', 
];

List<String> labelLinks = [
  // 'https://www.irasutoya.com/search/label/%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88',
  // 'https://www.irasutoya.com/search/label/%E3%81%93%E3%81%A9%E3%82%82',
  // 'https://www.irasutoya.com/search/label/%E8%81%B7%E6%A5%AD',
  // 'https://www.irasutoya.com/search/label/%E3%83%9D%E3%83%BC%E3%82%BA',
  // 'https://www.irasutoya.com/search/label/%E7%97%85%E6%B0%97',
  // 'https://www.irasutoya.com/search/label/%E3%81%8A%E9%87%91',
  // 'https://www.irasutoya.com/search/label/%E4%BC%9A%E7%A4%BE',
  // 'https://www.irasutoya.com/search/label/%E9%81%95%E5%8F%8D',
  // 'https://www.irasutoya.com/search/label/%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9',
  // 'https://www.irasutoya.com/search/label/%E9%81%93%E5%85%B7',
  // 'https://www.irasutoya.com/search/label/%E5%AD%A6%E6%A0%A1',
  // 'https://www.irasutoya.com/search/label/%E9%A3%9F%E3%81%B9%E7%89%A9',
  // 'https://www.irasutoya.com/search/label/%E4%BA%8B%E6%95%85',
  // 'https://www.irasutoya.com/search/label/%E3%83%95%E3%82%A1%E3%83%83%E3%82%B7%E3%83%A7%E3%83%B3',
  // 'https://www.irasutoya.com/search/label/%E8%B6%A3%E5%91%B3',
  // 'https://www.irasutoya.com/search/label/%E5%8C%BB%E7%99%82',
  // 'https://www.irasutoya.com/search/label/%E3%82%B9%E3%83%9D%E3%83%BC%E3%83%84',
  // 'https://www.irasutoya.com/search/label/%E5%BB%BA%E7%89%A9',
  // 'https://www.irasutoya.com/search/label/%E3%82%B9%E3%82%A4%E3%83%BC%E3%83%84',
  // 'https://www.irasutoya.com/search/label/%E3%81%8A%E3%82%82%E3%81%A1%E3%82%83',
  // 'https://www.irasutoya.com/search/label/%E6%97%85%E8%A1%8C',
  // 'https://www.irasutoya.com/search/label/%E5%AE%B6%E9%9B%BB',
  // 'https://www.irasutoya.com/search/label/%E5%AE%B6%E6%97%8F',
  'https://www.irasutoya.com/search/label/%E3%82%AD%E3%83%A3%E3%83%A9%E3%82%AF%E3%82%BF%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E6%96%87%E5%AD%97',
  'https://www.irasutoya.com/search/label/%E6%96%99%E7%90%86',
  'https://www.irasutoya.com/search/label/%E5%8B%95%E7%89%A9%E3%82%AD%E3%83%A3%E3%83%A9',
  'https://www.irasutoya.com/search/label/%E6%A9%9F%E6%A2%B0',
  'https://www.irasutoya.com/search/label/%E6%97%A5%E6%9C%AC',
  'https://www.irasutoya.com/search/label/%E3%83%9E%E3%83%BC%E3%82%AF',
  'https://www.irasutoya.com/search/label/%E8%BB%8A',
  'https://www.irasutoya.com/search/label/%E9%9F%B3%E6%A5%BD',
  'https://www.irasutoya.com/search/label/%E8%80%81%E4%BA%BA',
  'https://www.irasutoya.com/search/label/%E9%A3%B2%E3%81%BF%E7%89%A9',
  'https://www.irasutoya.com/search/label/%E3%83%91%E3%83%BC%E3%83%86%E3%82%A3',
  'https://www.irasutoya.com/search/label/%E5%AE%B6%E5%85%B7',
  'https://www.irasutoya.com/search/label/%E8%8B%A5%E8%80%85',
  'https://www.irasutoya.com/search/label/%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E5%8C%BB%E7%99%82%E6%A9%9F%E5%99%A8',
  'https://www.irasutoya.com/search/label/%E3%83%9E%E3%83%8A%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E4%B9%97%E3%82%8A%E7%89%A9',
  'https://www.irasutoya.com/search/label/%E3%82%B7%E3%83%A7%E3%83%83%E3%83%94%E3%83%B3%E3%82%B0',
  'https://www.irasutoya.com/search/label/%E3%82%B9%E3%83%9E%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%B3',
  'https://www.irasutoya.com/search/label/%E5%8B%95%E7%89%A9',
  'https://www.irasutoya.com/search/label/%E5%8F%8B%E9%81%94',
  'https://www.irasutoya.com/search/label/%E9%A3%9F%E4%BA%8B',
  'https://www.irasutoya.com/search/label/%E7%94%9F%E6%B4%BB',
  'https://www.irasutoya.com/search/label/%E5%A4%8F',
  'https://www.irasutoya.com/search/label/%E9%AD%9A',
  'https://www.irasutoya.com/search/label/%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8D%E3%83%83%E3%83%88',
  'https://www.irasutoya.com/search/label/%E9%87%8E%E8%8F%9C',
  'https://www.irasutoya.com/search/label/%E8%BB%BD%E9%A3%9F',
  'https://www.irasutoya.com/search/label/%E7%81%BD%E5%AE%B3',
  'https://www.irasutoya.com/search/label/%E5%8F%97%E9%A8%93',
  'https://www.irasutoya.com/search/label/%E6%81%8B%E6%84%9B',
  'https://www.irasutoya.com/search/label/%E5%86%AC',
  'https://www.irasutoya.com/search/label/%E7%BE%8E%E8%A1%93',
  'https://www.irasutoya.com/search/label/%E8%A1%A8%E6%83%85',
  'https://www.irasutoya.com/search/label/%E4%BA%BA%E4%BD%93',
  'https://www.irasutoya.com/search/label/%E9%81%8B%E5%8B%95',
  'https://www.irasutoya.com/search/label/%E4%BC%BC%E9%A1%94%E7%B5%B5',
  'https://www.irasutoya.com/search/label/%E6%88%A6%E4%BA%89',
  'https://www.irasutoya.com/search/label/%E3%83%9A%E3%83%83%E3%83%88',
  'https://www.irasutoya.com/search/label/%E6%8E%83%E9%99%A4',
  'https://www.irasutoya.com/search/label/%E4%B8%96%E7%95%8C',
  'https://www.irasutoya.com/search/label/%E7%9D%A1%E7%9C%A0',
  'https://www.irasutoya.com/search/label/%E7%BE%8E%E5%AE%B9',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E6%AD%A3%E6%9C%88',
  'https://www.irasutoya.com/search/label/%E6%9C%AC',
  'https://www.irasutoya.com/search/label/%E7%A7%91%E5%AD%A6',
  'https://www.irasutoya.com/search/label/%E9%A2%A8%E6%99%AF',
  'https://www.irasutoya.com/search/label/%E5%B0%B1%E6%B4%BB',
  'https://www.irasutoya.com/search/label/%E7%8A%AC',
  'https://www.irasutoya.com/search/label/%E8%99%AB',
  'https://www.irasutoya.com/search/label/%E8%8A%B1',
  'https://www.irasutoya.com/search/label/%E3%81%82%E3%81%8B%E3%81%A1%E3%82%83%E3%82%93',
  'https://www.irasutoya.com/search/label/%E3%83%95%E3%82%A1%E3%83%B3%E3%82%BF%E3%82%B8%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E9%B3%A5',
  'https://www.irasutoya.com/search/label/%E6%A4%8D%E7%89%A9',
  'https://www.irasutoya.com/search/label/%E6%B5%B7',
  'https://www.irasutoya.com/search/label/%E9%A3%9F%E6%9D%90',
  'https://www.irasutoya.com/search/label/%E3%83%95%E3%83%AB%E3%83%BC%E3%83%84',
  'https://www.irasutoya.com/search/label/%E6%96%87%E6%88%BF%E5%85%B7',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E5%B9%B4%E8%B3%80%E7%8A%B6',
  'https://www.irasutoya.com/search/label/%E7%89%A9%E8%AA%9E',
  'https://www.irasutoya.com/search/label/%E7%8C%AB',
  'https://www.irasutoya.com/search/label/%E4%BB%8B%E8%AD%B7',
  'https://www.irasutoya.com/search/label/%E3%82%A6%E3%82%A7%E3%83%87%E3%82%A3%E3%83%B3%E3%82%B0',
  'https://www.irasutoya.com/search/label/%E5%8D%97%E5%9B%BD',
  'https://www.irasutoya.com/search/label/%E8%AA%BF%E5%91%B3%E6%96%99',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E9%A2%A8%E5%91%82',
  'https://www.irasutoya.com/search/label/%E3%83%A9%E3%83%B3%E3%83%89%E3%83%9E%E3%83%BC%E3%82%AF',
  'https://www.irasutoya.com/search/label/%E5%BC%95%E8%B6%8A%E3%81%97',
  'https://www.irasutoya.com/search/label/%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9',
  'https://www.irasutoya.com/search/label/%E7%92%B0%E5%A2%83%E5%95%8F%E9%A1%8C',
  'https://www.irasutoya.com/search/label/%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88',
  'https://www.irasutoya.com/search/label/%E3%82%B9%E3%83%9D%E3%83%BC%E3%83%84%E7%94%A8%E5%85%B7',
  'https://www.irasutoya.com/search/label/%E4%B8%AD%E5%B9%B4',
  'https://www.irasutoya.com/search/label/%E5%A4%8F%E4%BC%91%E3%81%BF',
  'https://www.irasutoya.com/search/label/%E6%80%AA%E6%88%91',
  'https://www.irasutoya.com/search/label/%E9%AB%AA',
  'https://www.irasutoya.com/search/label/%E3%83%A1%E3%83%87%E3%82%A3%E3%82%A2',
  'https://www.irasutoya.com/search/label/%E5%BA%A7%E5%B8%83%E5%9B%A3',
  'https://www.irasutoya.com/search/label/%E6%9B%B8%E9%A1%9E',
  'https://www.irasutoya.com/search/label/%E5%B9%B2%E6%94%AF',
  'https://www.irasutoya.com/search/label/%E9%A3%9F%E5%99%A8',
  'https://www.irasutoya.com/search/label/%E6%94%BF%E6%B2%BB',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E7%A5%AD%E3%82%8A',
  'https://www.irasutoya.com/search/label/%E9%9B%BB%E8%BB%8A',
  'https://www.irasutoya.com/search/label/%E5%AE%97%E6%95%99',
  'https://www.irasutoya.com/search/label/%E3%82%B4%E3%83%9F',
  'https://www.irasutoya.com/search/label/%E5%B9%BC%E7%A8%9A%E5%9C%92',
  'https://www.irasutoya.com/search/label/%E6%A5%BD%E5%99%A8',
  'https://www.irasutoya.com/search/label/%E3%82%A8%E3%83%8D%E3%83%AB%E3%82%AE%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E3%83%91%E3%83%B3',
  'https://www.irasutoya.com/search/label/%E6%98%A0%E7%94%BB',
  'https://www.irasutoya.com/search/label/%E3%82%AA%E3%83%AA%E3%83%B3%E3%83%94%E3%83%83%E3%82%AF',
  'https://www.irasutoya.com/search/label/%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8',
  'https://www.irasutoya.com/search/label/%E9%A3%BE%E3%82%8A',
  'https://www.irasutoya.com/search/label/%E8%BE%B2%E6%A5%AD',
  'https://www.irasutoya.com/search/label/%E8%87%AA%E8%BB%A2%E8%BB%8A',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E5%AF%BF%E5%8F%B8',
  'https://www.irasutoya.com/search/label/%E9%A3%9F%E3%81%B9%E7%89%A9%E3%82%AD%E3%83%A3%E3%83%A9',
  'https://www.irasutoya.com/search/label/%E3%83%80%E3%83%B3%E3%82%B9',
  'https://www.irasutoya.com/search/label/%E4%BD%93%E8%82%B2',
  'https://www.irasutoya.com/search/label/POP',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E8%91%AC%E5%BC%8F',
  'https://www.irasutoya.com/search/label/%E6%80%9D%E3%81%84%E5%87%BA',
  'https://www.irasutoya.com/search/label/%E5%91%A8%E8%BE%BA%E6%A9%9F%E5%99%A8',
  'https://www.irasutoya.com/search/label/%E3%83%A1%E3%82%BF%E3%83%9C%E3%83%AA%E3%83%83%E3%82%AF',
  'https://www.irasutoya.com/search/label/%E6%A3%92%E4%BA%BA%E9%96%93',
  'https://www.irasutoya.com/search/label/%E6%A2%85%E9%9B%A8',
  'https://www.irasutoya.com/search/label/%E6%AD%AF',
  'https://www.irasutoya.com/search/label/%E6%98%A5',
  'https://www.irasutoya.com/search/label/%E9%9B%86%E5%90%88',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E8%AA%95%E7%94%9F%E6%97%A5',
  'https://www.irasutoya.com/search/label/%E8%8B%B1%E8%AA%9E',
  'https://www.irasutoya.com/search/label/%E9%81%8B%E5%8B%95%E4%BC%9A',
  'https://www.irasutoya.com/search/label/%E3%82%B5%E3%83%83%E3%82%AB%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E3%82%AB%E3%83%95%E3%82%A7',
  'https://www.irasutoya.com/search/label/%E3%83%90%E3%83%AC%E3%83%B3%E3%82%BF%E3%82%A4%E3%83%B3',
  'https://www.irasutoya.com/search/label/%E5%AE%87%E5%AE%99',
  'https://www.irasutoya.com/search/label/%E5%AE%A4%E5%86%85',
  'https://www.irasutoya.com/search/label/%E9%87%8E%E7%90%83',
  'https://www.irasutoya.com/search/label/%E7%A7%8B',
  'https://www.irasutoya.com/search/label/%E5%90%B9%E5%A5%8F%E6%A5%BD',
  'https://www.irasutoya.com/search/label/%E6%AD%8C',
  'https://www.irasutoya.com/search/label/%E5%8D%92%E6%A5%AD%E5%BC%8F',
  'https://www.irasutoya.com/search/label/%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0',
  'https://www.irasutoya.com/search/label/%E7%88%AC%E8%99%AB%E9%A1%9E%E4%B8%A1%E7%94%9F%E9%A1%9E',
  'https://www.irasutoya.com/search/label/%E5%81%A5%E5%BA%B7%E8%A8%BA%E6%96%AD',
  'https://www.irasutoya.com/search/label/%E3%83%88%E3%82%A4%E3%83%AC',
  'https://www.irasutoya.com/search/label/%E3%81%B4%E3%82%87%E3%81%93',
  'https://www.irasutoya.com/search/label/%E6%96%B0%E7%A4%BE%E4%BC%9A%E4%BA%BA',
  'https://www.irasutoya.com/search/label/%E3%83%8F%E3%83%AD%E3%82%A6%E3%82%A3%E3%83%B3',
  'https://www.irasutoya.com/search/label/%E3%83%A9%E3%82%A4%E3%83%B3',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E5%BC%81%E5%BD%93',
  'https://www.irasutoya.com/search/label/%E6%96%87%E5%8C%96%E7%A5%AD',
  'https://www.irasutoya.com/search/label/%E3%82%B4%E3%83%BC%E3%83%AB%E3%83%87%E3%83%B3%E3%82%A6%E3%82%A3%E3%83%BC%E3%82%AF',
  'https://www.irasutoya.com/search/label/%E5%A4%A9%E6%B0%97',
  'https://www.irasutoya.com/search/label/%E6%B7%B1%E6%B5%B7',
  'https://www.irasutoya.com/search/label/%E5%8F%A4%E4%BB%A3%E7%94%9F%E7%89%A9',
  'https://www.irasutoya.com/search/label/%E6%BC%81%E6%A5%AD',
  'https://www.irasutoya.com/search/label/%E6%B4%97%E6%BF%AF',
  'https://www.irasutoya.com/search/label/%E5%A4%8F%E3%83%90%E3%83%86',
  'https://www.irasutoya.com/search/label/%E3%81%82%E3%81%84%E3%81%95%E3%81%A4',
  'https://www.irasutoya.com/search/label/%E8%B2%9D',
  'https://www.irasutoya.com/search/label/%E4%BA%BA%E4%BD%93%E3%82%AD%E3%83%A3%E3%83%A9',
  'https://www.irasutoya.com/search/label/%E5%9C%B0%E5%9B%B3',
  'https://www.irasutoya.com/search/label/%E8%A3%81%E7%B8%AB',
  'https://www.irasutoya.com/search/label/%E3%81%93%E3%81%A9%E3%82%82%E8%81%B7%E6%A5%AD',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E8%8A%B1%E8%A6%8B',
  'https://www.irasutoya.com/search/label/%E7%94%B2%E6%AE%BB%E9%A1%9E',
  'https://www.irasutoya.com/search/label/%E5%B9%B4%E3%81%AE%E7%80%AC',
  'https://www.irasutoya.com/search/label/%E4%B8%96%E4%BB%A3',
  'https://www.irasutoya.com/search/label/%E4%BB%8F%E5%83%8F',
  'https://www.irasutoya.com/search/label/%E6%96%B0%E5%AD%A6%E6%9C%9F',
  'https://www.irasutoya.com/search/label/%E5%9C%B0%E5%9F%9F%E3%82%AD%E3%83%A3%E3%83%A9',
  'https://www.irasutoya.com/search/label/%E8%8A%B1%E7%81%AB',
  'https://www.irasutoya.com/search/label/%E3%82%B9%E3%83%BC%E3%83%97',
  'https://www.irasutoya.com/search/label/%E5%85%A5%E5%AD%A6%E5%BC%8F',
  'https://www.irasutoya.com/search/label/%E5%88%9D%E8%A9%A3',
  'https://www.irasutoya.com/search/label/%E9%9F%B3%E6%A5%BD%E5%AE%B6',
  'https://www.irasutoya.com/search/label/%E7%B4%85%E8%91%89',
  'https://www.irasutoya.com/search/label/%E3%81%93%E3%81%A9%E3%82%82%E3%81%AE%E6%97%A5',
  'https://www.irasutoya.com/search/label/%E6%9E%97%E6%A5%AD',
  'https://www.irasutoya.com/search/label/%E6%81%90%E7%AB%9C',
  'https://www.irasutoya.com/search/label/%E7%B5%A6%E9%A3%9F',
  'https://www.irasutoya.com/search/label/%E7%88%B6%E3%81%AE%E6%97%A5',
  'https://www.irasutoya.com/search/label/%E5%BF%98%E5%B9%B4%E4%BC%9A',
  'https://www.irasutoya.com/search/label/VR',
  'https://www.irasutoya.com/search/label/%E5%BF%8D%E8%80%85',
  'https://www.irasutoya.com/search/label/%E7%A5%9D%E6%97%A5',
  'https://www.irasutoya.com/search/label/%E4%BA%BA%E5%B7%A5%E7%9F%A5%E8%83%BD',
  'https://www.irasutoya.com/search/label/%E7%AF%80%E5%88%86',
  'https://www.irasutoya.com/search/label/%E6%AF%8D%E3%81%AE%E6%97%A5',
  'https://www.irasutoya.com/search/label/LGBT',
  'https://www.irasutoya.com/search/label/%E3%82%AF%E3%82%B8%E3%83%A9%E3%82%A4%E3%83%AB%E3%82%AB',
  'https://www.irasutoya.com/search/label/%E6%9B%B8%E9%81%93',
  'https://www.irasutoya.com/search/label/%E3%83%9A%E3%83%B3%E3%82%AE%E3%83%B3',
  'https://www.irasutoya.com/search/label/%E3%83%A8%E3%82%AC',
  'https://www.irasutoya.com/search/label/%E4%B9%97%E3%82%8A%E7%89%A9%E3%82%AD%E3%83%A3%E3%83%A9',
  'https://www.irasutoya.com/search/label/%E5%A4%A7%E6%99%A6%E6%97%A5',
  'https://www.irasutoya.com/search/label/%E3%83%91%E3%83%A9%E3%83%AA%E3%83%B3%E3%83%94%E3%83%83%E3%82%AF',
  'https://www.irasutoya.com/search/label/%E5%8B%95%E7%89%A9%E3%81%AE%E9%A1%94',
  'https://www.irasutoya.com/search/label/%E6%97%A5%E7%84%BC%E3%81%91',
  'https://www.irasutoya.com/search/label/%E3%83%9B%E3%83%AF%E3%82%A4%E3%83%88%E3%83%87%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E4%B8%83%E5%A4%95',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E3%81%AB%E3%81%8E%E3%82%8A',
  'https://www.irasutoya.com/search/label/%E9%99%B8%E4%B8%8A',
  'https://www.irasutoya.com/search/label/%E6%9A%91%E4%B8%AD%E8%A6%8B%E8%88%9E%E3%81%84',
  'https://www.irasutoya.com/search/label/%E6%98%9F%E5%BA%A7',
  'https://www.irasutoya.com/search/label/%E6%88%90%E4%BA%BA%E5%BC%8F',
  'https://www.irasutoya.com/search/label/%E6%95%AC%E8%80%81%E3%81%AE%E6%97%A5',
  'https://www.irasutoya.com/search/label/%E9%87%8E%E8%8F%9C%E3%81%AE%E5%88%87%E3%82%8A%E6%96%B9',
  'https://www.irasutoya.com/search/label/%E3%81%B2%E3%81%AA%E7%A5%AD%E3%82%8A',
  'https://www.irasutoya.com/search/label/%E3%81%8A%E6%9C%88%E8%A6%8B',
  'https://www.irasutoya.com/search/label/%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3',
  'https://www.irasutoya.com/search/label/%E4%BC%9D%E8%A8%80%E3%83%A1%E3%83%A2',
  'https://www.irasutoya.com/search/label/%E9%A1%94%E3%82%A2%E3%82%A4%E3%82%B3%E3%83%B3',
  'https://www.irasutoya.com/search/label/LINE%E3%82%B9%E3%82%BF%E3%83%B3%E3%83%97',
  'https://www.irasutoya.com/search/label/%E3%82%A4%E3%83%BC%E3%82%B9%E3%82%BF%E3%83%BC',
  'https://www.irasutoya.com/search/label/%E5%8B%A4%E5%8A%B4%E6%84%9F%E8%AC%9D%E3%81%AE%E6%97%A5',
  'https://www.irasutoya.com/search/label/%E3%82%86%E3%82%81%E3%81%8B%E3%82%8F',
  'https://www.irasutoya.com/search/label/%E5%9B%BD%E6%97%97',
  'https://www.irasutoya.com/search/label/%E4%B8%80%E7%AD%86%E7%AE%8B',
  'https://www.irasutoya.com/search/label/%E3%83%88%E3%83%A9%E3%83%B3%E3%83%97',
  'https://www.irasutoya.com/search/label/%E4%B8%83%E4%BA%94%E4%B8%89',
  'https://www.irasutoya.com/search/label/%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8%E3%82%AB%E3%83%BC%E3%83%89',
  'https://www.irasutoya.com/search/label/%E6%9B%B8%E4%BD%93',
  'https://www.irasutoya.com/search/label/%E3%82%A8%E3%82%A4%E3%83%97%E3%83%AA%E3%83%AB%E3%83%95%E3%83%BC%E3%83%AB',
  'https://www.irasutoya.com/search/label/%E7%A6%81%E6%AD%A2',
  'https://www.irasutoya.com/search/label/%E5%9B%BD%E6%97%97%E3%81%BE%E3%81%A8%E3%82%81',
  'https://www.irasutoya.com/search/label/%E3%83%9A%E3%83%B3%E3%82%AD%E6%9B%B8%E4%BD%93',
  'https://www.irasutoya.com/search/label/%E5%AE%A3%E4%BC%9D',
  'https://www.irasutoya.com/search/label/%E7%99%BD%E6%8A%9C%E3%81%8D%E6%9B%B8%E4%BD%93',
];

// Beautifulsoup 使用教學: https://pub.dev/packages/beautifulsoup
void practice01() async {
  var path = Directory.current.path + '\\others\\images\\';
  int currentPageIndex;
  int cureentLabelIndex;

  var hasNextPage = false;
  List<String> linkData;

  cureentLabelIndex = 0;

  for (var labelLink in labelLinks) {
    var url = labelLink;

    currentPageIndex = 0;
    cureentLabelIndex++;

    while (true) {
      print('---------------------------------------------');
      linkData = [];
      hasNextPage = false;

      currentPageIndex++;
      var response = await httpGet(url);

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
        var _res;

        _res = await httpGet(link);

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

        await _imageLinks.forEach((imageLink) async {
          var filename = RegExp('.*\/(.*png|.*jpg)\$').firstMatch(imageLink).group(1);
          await httpGet(imageLink).then((res) {
            File(path + labels[cureentLabelIndex - 1] + '\\' + filename)
              .create(recursive: true)
              .then((file) {
                file.writeAsBytes(res.bodyBytes);
              });
          });
        });
      });

      if (!hasNextPage) {
        break;
      }
    }
  }
}

// void _handleWebException(Function f) async {
//   while(true) {
//     try {
//       await f();
//       break;
//     } catch (e) {
//       // ...
//     }
//   }
// }

Future<Response> httpGet(String url) async {
  http.Response response;
  while(true) {
    try {
      response = await http.get(url);
      if (response.statusCode != 200) {
        continue;
      }
      break;
    } catch (e) {
      // ...
    }
  }
  return response;
}