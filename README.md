# いらすとや 爬蟲

## 下載圖片流程、目標結構

## 參考文章 python

參考 [「いらすとや」の画像をスクレイピングで自動収集してみた](https://qiita.com/japanesebonobo/items/eb374a94ed0456c88ed7)

### 分析流程

- 最上層：迴圈，跑 `begin` ~ `end` 的頁面
- 全域變數名稱: `linkData = []` (儲存圖片連結)

---

如果是第一頁，做以下的事：

- 取得 `url = '.../label/<頁籤名稱>'`
- 找到所有 `a[href]`
- 對所有 `a`
  - 取出 `href`
  - if `href` 符合 `irasutoya.*blog-post.*html$` (regex)
    - 如果不包含在 `linkData` 裡，加入到陣列
  - if `href` 含有 `max-results=20&start=20&by-date=false` (regex) (這代表下一頁的網址)
    - 將此 `href` 存起來
- 對所有 `linkData` 的 `link`
  - http.get(link)
  - 找到所有符合 `.separator > a` 的元素，並對 `a`
  - 取得 `a` 的 `href` (存入變數 `imageLink`)
  - `imageLink` 找到 `.*\/(.*png|.*jpg)$` (regex) (存入變數 `filename`)
  - 透過 `imageLink` 下載圖片

---

如果不是第一頁，做以下的事：

做的事情都一樣，除了，`max-results=20&start='+str(p*20)+'&by-date=false$` 的地方

因此可以不需要 if-else 判斷

### 程式碼

1. 透過 `imageLink` 下載圖片

    ```dart
    http.get(url).then((response) {
        new File(path).writeAsBytes(response.bodyBytes);
    });
    ```

1. s
