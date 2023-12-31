# Loop-SAATHI

* ผู้พัฒนา: NVDA_TH <nvdainth@gmail.com>
* ดาวน์โหลด [beta version](https://raw.githubusercontent.com/NVDATH/Loop-SAATHI/main/loop-Saathi-0.2.nvda-addon)
* เข้ากันได้กับ NVDA 2023.2

ส่วนเสริมตัวนี้จะช่วยให้คุณสามารถใช้งานโปรแกรม SAATHI ได้สะดวกยิ่งขึ้น
เนื่องจากข้อจำกัดของตัวโปรแกรมที่ต้องกดเลื่อนทีละหน้า ถึงจะ export ข้อมูลออกมาได้
ฟังก์ชันหลักของ Loop-SAATHI ก็คือการช่วยกดเลื่อนหน้าให้เราอยู่เบื้องหลัง
ทำให้เราไม่ต้องกดเลื่อนหน้าเอง และไม่ต้องโฟกัสอยู่ที่หน้าโปรแกรมตลอด

## ทำความเข้าใจกันก่อนใช้งาน

อย่างแรก ถ้าใครยังไม่รู้จักโปรแกรม SAATHI ที่ช่วยเราถอด OCR จากไฟล์ PDF แบบ scann และสามารถ export ข้อความออกมาเป็นไฟล์ text ได้
และข้อสำคัญคือรองรับภาษาไทยได้ค่อนข้างดีกว่าใช้ service ตัวอื่นๆ แนะนำให้เข้าไปดูคลิปแนะนำตัวโปรแกรมจากทาง [สำนักหอสมุดเบญญาลัย](https://www.youtube.com/watch?v=Jv6T4W-a_cQ) กันก่อน

เมื่อติดตั้งโปรแกรม SAATHI เรียบร้อยแล้ว
ให้มั่นใจว่า ตัวโปรแกรมถูกติดตั้งไว้ที่ "C:\Program Files (x86)\Install Saathi V1.0\Saathi\saathi.exe" ซึ่งเป็นค่าเริ่มต้นที่ทางนักพัฒนาตั้งค่าไว้ ไม่ได้แก้ไขเปลี่ยนแปลงอะไร
เพราะการทำงานของส่วนเสริม Loop-SAATHI เราจะต้องใช้ที่อยู่ของโปรแกรมตามนี้เป็นหลัก

สิ่งที่ต้องเข้าใจถัดมาก็คือ ทั้งตัวโปรแกรม SAATHI เอง และตัวส่วนเสริม Loop-SAATHI นี้ ดูจะเป็นโปรแกรมที่ไม่ได้สมบูรณ์มากนัก
ดูจากการติดตั้งของตัว SAATHI เองที่เหมือนนักพัฒนาตั้งค่าบางอย่างผิดพลาด ชื่อโฟลเดอร์ของโปรแกรมก็ดูแปลกๆ icon ที่ได้หลังจากติดตั้งตัวโปรแกรม แทนที่จะเป็นชื่อของตัวโปรแกรม แต่เราได้ icon ที่ชื่อว่า icon บน desktop มาแทน...

และตัวส่วนเสริม Loop-SAATHI ที่ผู้เขียนเขียนขึ้นมานี้ จริงๆ ก็ตั้งใจจะเขียนเพื่อใช้งานเอง แต่ก็มองว่าไหนๆ ก็เขียนแล้ว ปรับปรุงให้ผู้ใช้ทั่วไปสามารถใช้งานได้ด้วย และนำมาแจกเป็นสาธารณะ ก็น่าจะมีประโยชน์กับคนอื่นได้บ้าง ไม่มากก็น้อย

ดังนั้นการใช้งานโปรแกรม SAATHI และส่วนเสริม Loop-SAATHI ก็อาจจะมีข้อผิดพลาดได้ ซึ่งผู้ใช้อาจจะต้องแก้ไขปัญหาได้ด้วยตัวเองในส่วนนึง
เช่นต้องการถอดทั้งหมด แต่โปรแกรมมักจะค้างที่บางจุด 

สิ่งที่ต้องแจ้งให้ผู้ใช้ตระหนักอย่างนึงก็คือ ตัวโปรแกรม SAATHI เป็นโปรแกรมที่ทำงาน online เท่านั้น สามารถทดสอบดูได้ เมื่อไม่ได้ต่ออินเทอร์เน็ต และเปิดโปรแกรมขึ้นมา พอเราเลือกไฟล์ที่ต้องการแล้ว โปรแกรมจะขึ้นข้อความแจ้งข้อผิดพลาดทันที
ดังนั้นผู้ใช้อาจต้องพึงระวังว่าข้อมูลที่จะนำมาให้โปรแกรมนี้ถอด OCR นั้น มีความสำคัญหรือไม่ เป็นความลับหรือเปล่า
เนื่องจากผู้เขียนเอง ก็ไม่สามารถหาข้อมูลเพิ่มเติมเกี่ยวกับโปรแกรมตัวนี้ได้ จึงไม่ทราบว่า service ที่นักพัฒนาดึงมาใช้ ใช้งานจากที่ไหน และมีเงื่อนไขในการใช้งานอย่างไรหรือไม่

ถ้าผู้ใช้รับทราบ และเข้าใจถึงความเสี่ยงในการใช้โปรแกรมตัวนี้แล้ว ต่อไปเราจะมาแนะนำวิธีการติดตั้งและใช้งานในฟังก์ชันต่างๆ ของส่วนเสริม Loop-SAATHI นี้กัน

## วิธีติดตั้ง

ผู้ใช้สามารถดาวน์โหลดและติดตั้งส่วนเสริมตามขั้นตอนการติดตั้งด้วยตัวเองของ NVDA ได้ตามปกติจากลิงก์ด้านบน

## วิธีใช้งาน

เมื่อติดตั้งส่วนเสริม Loop-SAATHI แล้ว ให้ผู้ใช้ไปโฟกัสอยู่ที่ไฟล์ที่ต้องการ ในหน้า Windows Explorer
จากนั้นกดคีย์ลัด control+windows+i จะได้ยิน NVDA พูดว่า "action Loop-SAATHI"
ส่วนเสริมจะเปิดไฟล์ที่ผู้ใช้เลือกด้วยโปรแกรม SAATHI ขึ้นมาให้

และจะแบ่งการทำงานเป็นสองโหมดหลักๆ คือ

### โหมดการถอด OCR จากไฟล์รูปภาพ

ผู้ใช้สามารถเลือกไฟล์รูปภาพนามสกุลต่างๆ เพื่อถอด OCR ได้
(ซึ่งจำเป็นต้องติดตั้งโปรแกรม Image Magick เพิ่มเติมก่อน)
สามารถอ่านวิธีดาวน์โหลดโปรแกรม ImageMagick ได้จากด้านล่าง
และถ้าหากผู้ใช้ยังไม่ได้ติดตั้งโปรแกรม ImageMagick ส่วนเสริมก็จะขึ้นข้อความแจ้งให้ไปดาวน์โหลดมาติดตั้งก่อน

ทั้งนี้กรณีที่ต้องการถอด OCR จากรูปภาพ จะเหมือนกรณีที่เราต้องการถอด OCR จากไฟล์ PDF ที่มีเพียงหน้าเดียว
โดยเมื่อส่วนเสริมสั่งให้เปิดไฟล์ที่ผู้ใช้เลือกด้วยโปรแกรม SAATHI ขึ้นมาแล้ว ส่วนเสริมจะเลื่อน cursur ไปยังช่อง edit  multi line ที่เป็นส่วนในการแสดงข้อความที่ถอด oCR ออกมาแล้วให้ผู้ใช้ทันที
ซึ่งผู้ใช้จะได้ยินโปรแกรม NVDA อ่านข้อความที่เป็นข้อความที่นักพัฒนาใส่ไว้เมื่อเราเปิดโปรแกรมขึ้นมาทุกครั้งก่อน

> Developed By:
> Ashish Kaushik and Stefan Moisei.
> 
> Email: smartprogrammers.sp @gmail.com
> Serial No.: static_hardware_id

และจำเป็นต้องรอสักครู่ เพื่อให้โปรแกรมประมวลผล และเปลี่ยนข้อความในช่องนี้ให้เป็นข้อความที่ถอด OCR ออกมาจากไฟล์ที่ผู้ใช้เลือก

กรณีนี้ส่วนเสริมจะทำงานเสร็จสิ้นตรงที่พา cursur มาอยู่ตรงนี้และรอโปรแกรม SAATHI ประมวลผล
ที่เหลือผู้ใช้ก็สามารถอ่านหรือคัดลอกข้อความที่ประมวลผลแล้วเพื่อใช้งานต่อไปได้ด้วยตัวเอง

### การถอด OCR จากไฟล์ pDF ที่มีหลายหน้า

กรณีที่เป็นไฟล์ PDF ที่มีหลายหน้า และต้องการถอด oCR และ export ออกมาทั้งหมด
(ซึ่งเป็นวัตถุประสงค์หลักของส่วนเสริมนี้)

เมื่อผู้ใช้กดคีย์ลัด ณ ตำแหน่งของไฟล์ที่ต้องการแล้ว
ส่วนเสริมก็จะสั่งให้โปรแกรม SAATHI เปิดไฟล์นั้นขึ้นมาเช่นกัน แต่จะมีหน้าต่างเพื่อกำหนดค่าการทำงานของส่วนเสริมเพิ่มขึ้นมาให้อีกหน้าต่างนึง
ซึ่งตรงนี้ หากผู้ใช้ไม่ต้องการให้ส่วนเสริมทำงานต่อ ก็สามารถกดปิดหน้าต่างการตั้งค่านี้ออกไปได้ และเสมือนว่าใช้คีย์ลัดของส่วนเสริมเพื่อเป็นการเปิดไฟล์ PDF ด้วยโปรแกรม SAATHI แบบเร็วๆ ก็ได้เช่นกัน

ทั้งนี้ผู้เขียนทดสอบแล้ว พบว่า โปรแกรม SAATHI เอง เราไม่สามารถตั้งค่าให้เป็นโปรแกรมสำหรับเปิดไฟล์ pDF ในฟังก์ชัน openWith ของ Windows ได้ คาดว่าน่าจะเกิดจากการเขียนโปรแกรมที่ไม่ได้มาตรฐานนัก
ดังนั้น การใช้ส่วนเสริม Loop-SAATHI เป็นตัวช่วยในการเปิดไฟล์ PDF ด้วยโปรแกรมนี้ ก็ถือเป็นผลพลอยได้อีกช่องทางนึง

กรณีที่เราต้องการถอดข้อความทั้งหมดออกมา เราก็จะมาโฟกัสอยู่ที่หน้าต่าง Loop SAATHI กัน
ซึ่งจะมีส่วนประกอบดังต่อไปนี้

* edit box สำหรับใส่จำนวนหน้าที่ต้องการให้ส่วนเสริมประมวลผล โดยส่วนเสริมจะดึงค่าจำนวนหน้า "ทั้งหมด" ของไฟล์ที่ผู้ใช้เลือกขึ้นมาไว้ให้เป็นค่าปริยาย ซึ่งผู้ใช้สามารถแก้ไขเองได้
* check box export ไฟล์อัตโนมัติหลังจากส่วนเสริมทำงานสำเร็จ //ข้อนี้ก็ตรงตัวไม่มีอะไร หากต้องการได้ไฟล์ text อยู่แล้วก็สามารถติ๊กตัวเลือกนี้ได้เลย
* check box ลบข้อความระบุเลขหน้าที่สร้างจากโปรแกรม SAATHI รวมถึงข้อความ No text detected หากโปรแกรมไม่พบข้อความในหน้านั้นๆ //ไฟล์ text ที่ได้จากโปรแกรม SAATHI ตัวโปรแกรมจะใส่ข้อความระบุเลขหน้าเพิ่มเติมมาให้ ด้วยรูปแบบ "--- Page เลขหน้า ---" ซึ่งตรงนี้หากใครไม่ต้องการก็สามารถติ๊กตัวเลือกนี้ เพื่อให้ส่วนเสริมลบข้อความส่วนนี้ออกไปได้ และข้อความ "No text detected" อันนี้ก็เกิดจากการที่โปรแกรมไม่พบข้อมูลที่เป็น text ในหน้านั้นๆ ก็จะใส่ข้อความนี้มาให้เราทราบ เช่นกันถ้าไม่ต้องการให้มีข้อความนี้ในไฟล์ที่เรา export ก็ติ๊กตัวเลือกเดียวกันนี้เพื่อลบทั้งสองส่วนออกไปได้
* check box เปิดไฟล์ text ที่ export แล้วทันทีหลังจากส่วนเสริมทำงานสำเร็จ //ข้อนี้ก็ตรงตัวไม่มีอะไรเช่นกัน หากเราต้องการเปิดอ่านไฟล์ text ที่ export แล้วทันที ก็สามารถติ๊กตัวเลือกนี้ไว้ ส่วนเสริมก็จะเปิดไฟล์ขึ้นมาให้ผู้ใช้โดยอัตโนมัติหลังจากกระบวนการสำเร็จสมบูรณ์

ทั้งนี้หากผู้ใช้ต้องการถอด OCR เพียงบางส่วนของไฟล์ ก็สามารถระบุเลขหน้าที่ต้องการในช่องแรกเองได้ แต่อาจต้องมีขั้นตอนเพิ่มเติมเล็กน้อย

สมมติผู้ใช้ต้องการถอด OCR จากหน้าที่ 51 - 100
ในหน้าต่าง Loop SAATHI ก็ให้ใส่ตัวเลข 50 คือจำนวนหน้าทั้งหมดที่เราต้องการนั่นเอง
จากนั้นให้สลับไปยังหน้าต่างของตัวโปรแกรม SAATHI และไปกรอกเลขหน้า 51 และกดปุ่ม  jump to page เพื่อให้โปรแกรม โดดมาตั้งต้นที่หน้า 51 นั่นเอง

หากผู้ใช้เลือกให้ถอด OCR เพียงบางส่วน และติ๊กตัวเลือก export ไฟล์อัตโนมัติหลังจากส่วนเสริมทำงานสำเร็จ  ไว้ ไฟล์ text ที่ได้ จะมีหน้า 1 ติดมาด้วยเสมอ 

และเมื่อตั้งค่าตามที่ต้องการแล้ว ก็สามารถกดปุ่ม "เริ่ม" เพื่อเริ่มกระบวนการทำงานของตัวส่วนเสริมได้เลย

หลังจากเรากด "เริ่ม" แล้ว ส่วนเสริมจะคำนวณเวลาโดยประมาณที่ต้องใช้ในการทำงานและมีหน้าต่างแจ้งผู้ใช้ขึ้นมาบอกว่าต้องรอประมาณกี่นาที
ซึ่งเวลาในส่วนนี้คิดจากจำนวนหน้าที่ผู้ใช้สั่งให้ส่วนเสริมทำงาน คูณด้วย 3 วินาที ซึ่งเป็นค่าโดยประมาณที่ส่วนเสริมน่าจะใช้รอในการประมวลผลของโปรแกรม SAATHI ในดแต่ละหน้านั่นเอง

นอกจากนี้ หากพบว่าหน้าต่าง Loop SAATHI ไม่มี check box ให้เลือก ตามที่อธิบายไว้ก่อนหน้านี้ นั่นแปลว่า ในโฟลเดอร์ของไฟล์ PDF ที่ผู้ใช้ต้องการ export มีไฟล์ .txt ที่เป็นชื่อเดียวกับไฟล์ PDF ต้นฉบับอยู่แล้ว ซึ่งส่วนเสริมจะป้องกันการ export ทับด้วยการไม่มีตัวเลือกเหล่านั้น และจบกระบวนการทำงานให้ผู้ใช้ต้องกด export ด้วยตนเอง

**หมายเหตุ** ตัวเลือก export ไฟล์ text โดยอัตโนมัติ ไฟล์ text ที่ได้จะอยู่ตำแหน่งเดียวกับไฟล์ต้นฉบับ โดยเป็นชื่อเดียวกันต่างกันแค่นามสกุลไฟล์เท่านั้น

## การทำงานของตัวส่วนเสริม

ต้องแจ้งก่อนว่า ตัวส่วนเสริมนี้ผู้เขียนไม่ได้เขียนด้วยภาษา Python ซึ่งเป็นภาษาหลักที่ใช้ในการพัฒนาส่วนเสริมของโปรแกรม NVDA แต่อย่างใด เพียงแต่ต้องทำให้เป็นส่วนเสริม เพื่อง่ายต่อการใช้งาน และผู้ใช้สามารถกำหนดคีย์ลัดได้ด้วยตัวเองภายหลัง
(จาก NVDA menu > Preferences  > Input gestures... > Loop-SAATHI)

ซึ่งการทำงานของโค้ดทั้งหมด ถูกเขียนด้วย AutoHotkey และ compile เป็นไฟล์ .exe เพื่อให้ส่วนเสริมเรียกใช้อีกทอดนึง
โดยหากใครไม่แน่ใจ สามารถเข้าไปดูโค้ด AutoHotkey script ที่เป็นต้นทางได้จาก [loop-saathi.ahk](https://github.com/NVDATH/Loop-SAATHI/blob/main/loop-Saathi.ahk) และจะนำไป complie ใช้งานเองก็ได้ไม่ว่ากัน...

โดยจะอธิบายแต่ละขั้นตอนการทำงานของตัวส่วนเสริมให้เห็นภาพประมาณนี้ 

1.  ขั้นแรกส่วนเสริมจะเช็กก่อนว่าผู้ใช้ติดตั้งโปรแกรม SAATHI ไว้ยังโฟลเดอร์ "C:\Program Files (x86)\Install Saathi V1.0\Saathi\saathi.exe" หรือเปล่า ถ้าไม่พบ ก็จะแจ้งข้อความขึ้นมา
2. ส่วนเสริมจะเช็กว่าผู้ใช้เชื่อมต่ออินเทอร์เน็ตอยู่หรือเปล่า เพราะถ้าไม่ได้เชื่อมต่อ ก็จะไม่สามารถใช้โปรแกรม SAATHI ได้ ตามที่แจ้งไว้แล้วด้านบน
3. ส่วนเสริมจะเช็กว่ามี process ของโปรแกรม SAATHI อื่นๆ รันค้างอยู่หรือเปล่า ถ้ามีก็จะสั่งปิด process เก่าออกไป เนื่องจากการทำงานของสคริปต์จะต้องอ้างอิงจากหน้าต่างที่เป็นชื่อโปรแกรม SAATHI ดังนั้นเราไม่สามารถเปิดโปรแกรม SAATHI ไว้หลายหน้าต่างพร้อมกันได้
4. ส่วนเสริมจะตรวจประเภทของไฟล์ที่ผู้ใช้เลือก หากเป็นไฟล์รูปภาพหรือไฟล์ PDF ก็จะดำเนินการตามที่แจ้งไว้ด้านบน หรือหากเป็นไฟล์ประเภทอื่นๆ ก็จะขึ้นข้อความแจ้งว่าไม่รองรับ
5. เมื่อผู้ใช้กด "เริ่ม" แล้ว โฟกัสควรจะอยู่ที่หน้าต่างโปรแกรม SAATHI และตัวส่วนเสริมก็จะสั่งให้คีย์บอร์ดกด "alt+n" เพื่อเลื่อนหน้าไปเรื่อยๆ จนกว่าจะครบตามจำนวนที่ผู้ใช้กำหนด ซึ่งในส่วนนี้ ส่วนเสริมจะตรวจข้อความในช่องที่ระบุหน้า ร่วมกับข้อความในช่องเนื้อหา เมื่อทั้งสองส่วนมีความเปลี่ยนแปลง ก็ตีความได้ว่าโปรแกรมประมวลผลหน้านั้นๆ เสร็จแล้ว ก็จะกด "alt+N" ไปยังหน้าถัดไปให้เรื่อยๆ 
6. ระหว่างที่ส่วนเสริมทำงานตามข้อ 5. หากโปรแกรม SAATHI เกิดข้อผิดพลาด ซึ่งอาจจะแจ้งข้อความขึ้นมา หรือส่วนใหย่ที่ผู้เขียนเจอคือโปรแกรมจะปิดตัวเองไปเองเฉยๆ เมื่อส่วนเสริมตรวจไม่พบว่ามี process ของโปรแกรม SAATHI ทำงานอยู่ ก็จะหยุดการทำงาน และแจ้งผู้ใช้ว่าเกิดข้อผิดพลาด ณ หน้าไหน เพื่อที่ผู้ใช้อาจจะปรับเปลี่ยนการทำงานในครั้งถัดไปได้ด้วยตัวเอง
7. กรณีที่ผู้ใช้เลือก export ไฟล์ text อัตโนมัติ หลังจาก export ออกมาแล้ว ถ้าผู้ใช้เลือกที่จะให้ส่วนเสริมรันครบทั้งไฟล์ (สมมติไฟล์มี 100 หน้า และก็ทำงานถอด OCR ออกมาทั้ง 100 หน้า) ก็คือไม่ได้แก้ไขค่าเลขหน้าในหน้าต่าง Loop SAATHI ใดๆ ตัวสคริปต์จะเช็กความถูกต้องของไฟล์ที่ export ออกมาได้ว่ามีหน้าไหนขาดหายไปหรือเปล่า โดยดูจากข้อความระบุเลขหน้าที่ตัวโปรแกรม SAATHI สร้างขึ้นมา ถ้าหากถูกต้อง ครบถ้วน ก็จะแจ้งว่าสคริปต์ทำงานสมบูรณ์ แต่ถ้าหากมีหน้าไหนขาดหายไป ก็จะแจ้งว่าไฟล์ที่เรา export ออกมานั้น ผิดพลาดที่หน้าไหน

## หมายเหตุเพิ่มเติม

1. ระหว่างที่ส่วนเสริมทำงาน เราจะได้ยินโปรแกรม NVDA พูดว่า N n n ไปเรื่อยๆ ซึ่งเกิดจากการที่ตัวโปรแกรม NVDA อ่านออกเสียงแป้นพิมพ์ที่ถูกสั่งให้ทำงานอยู่เบื้องหลังนั่นเอง คำแนะนำก็คือ ระหว่างที่ใช้ส่วนเสริมทำงานให้เราอยู่ ผู้ใช้สามารถปรับการตั้งค่า speak typed characters เป็น off ไปก่อน
2. นอกจากข้อ 1. แล้ว เราต้องเข้าใจว่าการทำงานของส่วนเสริมก็เป็นการกดคีย์ "alt+N" ในเบื้องหลังไปเรื่อยๆ ดังนั้นหากผู้ใช้กดคีย์บอร์ดที่มีปุ่ม alt ร่วมด้วย ก็อาจจะเกิดการกวนกันของสองคำสั่งได้ ดังนั้นระหว่างรอส่วนเสริมทำงาน ผู้ใช้สามารถไปโฟกัสที่หน้าต่างอื่นได้ก็จริง แต่แนะนำว่าให้ไปอยู่ในตำแหน่งอื่นและไม่สลับหน้าต่างบ่อยๆ เช่นสลับไปดูหนังฟังเพลง ฟัง podcast อ่านไฟล์ text หรืออ่านข้อมูลใน browser ก็จะไม่มีปัญหาอะไร
3. ตามที่แจ้งไปแล้วตอนต้นว่าทั้งตัวโปรแกรม SAATHI เอง และส่วนเสริม Loop-SAATHI นี้ยังไม่ค่อยเสถียร พอๆ กัน ดังนั้นมีความเป็นไปได้ที่ระหว่างการทำงาน โปรแกรม SAATHI จะพบข้อผิดพลาด และหยุดทำงานไปเฉยๆ ซึ่งตัวส่วนเสริมก็จะพยายามตรวจและแจ้งผู้ใช้ว่าโปรแกรมหยุดทำงานไปที่หน้าไหน เพื่อผู้ใช้จะได้พยายามดำเนินการใหม่และแก้ไขให้ผ่านจุดที่มีปัญหาไปได้ เช่น สมมติไฟล์ที่ดำเนินการมักจะพบปัญหาแถวๆ หน้าที่ 90 ผู้ใช้อาจจะเลือกถอดข้อความออกมาแค่ 80 หน้าก่อน ในครั้งแรก จากนั้นครั้งถัดไป ค่อยเริ่มถอดข้อความจากหน้าที่ 81 และไล่ให้พ้นส่วนที่เคยมีปัญหาต่อไป


#### วิธีดาวน์โหลดโปรแกรม ImageMagick

สามารถดาวน์โหลดโปรแกรม Image Magick ได้จาก <https://imagemagick.org/script/download.php>

เมื่อเข้าไปแล้ว จะเลื่อนหา heading Windows Binary Release ก็ได้ ซึ่งจะเป็น heading ล่างสุด

หรือวิธีที่ง่ายกว่าคือไปยังตารางล่างสุด (กด shift+t จากส่วนท้ายของเพจขึ้นมา)
ลิงก์ดาวน์โหลดสำหรับ Windows 64bit จะอยู่บนๆ และถ้าต้องการสำหรับ Windows 32bit จะอยู่ล่างๆ ลงไปหน่อย

ทั้งนี้แนะนำให้เข้าไปดาวน์โหลดจากเว็บของผู้พัฒนาโดยตรง เพื่อที่ผู้ใช้จะได้เวอร์ชันล่าสุด

ขั้นตอนการติดตั้งก็เหมือนการติดตั้งโปรแกรมทั่วไป ผู้ใช้ไม่จำเป็นต้องเลือกตัวเลือกอะไรเพิ่มเติมเป็นพิเศษ
และเมื่อติดตั้งแล้วก็ไม่จำเป็นต้องตั้งค่าอะไรเพิ่มเติมเช่นกัน