# OpenAPI Practice
> 2022.07.26 ~ 2022.08.01 (1์ฃผ๊ฐ) <br/>
> 'CGV' App

<img width="1528" alt="image" src="https://user-images.githubusercontent.com/74815957/184096881-745d9302-2edf-405f-81c9-df107f0abbff.png">


## ๐ย Project Goal
- OpenAPI์ฌ์ฉํ์ฌ ๋ฐ์ดํฐ๋ฐ์์์ ๊ตฌํ<br/>
- pageViewController ์ฌ์ฉํ์ฌ ์ฌ๋ผ์ด๋ฉ ํ๋ฉด ๊ตฌํ <br/>


<br/><br/>
## ๐ ์ฌ์ฉํ ๋ผ์ด๋ธ๋ฌ๋ฆฌ
- Alamofire
 - ๋คํธ์ํฌ ํต์  
- SwiftyJSON
 - JSON Parsing

> pod init ํ์ผ <br/>
```bash
pod 'Alamofire'
pod 'SwiftyJSON', '~> 4.0'
```


<br/><br/>
## ๐ ์๊ฒ๋ ์ 
- CocoaPod๋ก ๋ผ์ด๋ธ๋ฌ๋ฆฌ์ค์นํ๊ธฐ<br/>
- ๋ฐ์ดํฐ๋ฅผ ๊ฐ์ ธ์จ ํ ์ปฌ๋ ์๋ทฐ์ ๋์ฐ๊ธฐ <br/>
  โ self.collectionView.reloadData() ์ด์ฉ <br/>
  โ ํด๋นํ๋ ๋ฐ์ดํฐ๋ฅผ ๋ถ๋ฌ์จ ํ ์ปฌ๋ ์๋ทฐ ๋ฆฌ๋ก๋ ์์ผ์ฃผ๊ธฐ <br/>
- ์ด๋ฏธ์ง URL๋ก ๋ถ๋ฌ์ฌ ๋ <br/>
  โ DispatchQueue.global().async ๋ถ๋ฌ์จ ํ โ DispatchQueue.main.sync ์์์ ์ด๋ฏธ์ง๋ทฐ์ ๋ฟ๋ ค์ค๋ค

<br/><br/>
## ๐ ์์ฌ์ด ์ 
- ์๋จํญ๋ฐ ์ธ๋๊ฒ์ดํฐ ์์ง์<br/>
- ์ํ์ ๋ง๋ ํฌ์คํฐ ์ด๋ฏธ์ง๋ฅผ ๊ฐ์ ธ์ค๊ธฐ์ํด ์ํ์์๋ ์ํ์งํฅ์์ํ์ API ์ฌ์ฉํ์๊ณ  ์ํ ํฌ์คํฐ ์ด๋ฏธ์ง๋ ๋ค์ด๋ฒ ๊ฒ์ API๋ฅผ ์ด์ฉํ์๋ค.


<br/><br/>
## ๐ ๋ฏธ๋ฆฌ๋ณด๊ธฐ



https://user-images.githubusercontent.com/74815957/184098245-929cd98e-486c-4628-a387-3076f1f290a7.mov



https://user-images.githubusercontent.com/74815957/184098257-853fa0f3-559a-443c-b3c2-621cc683b652.mov




<br/><br/>

