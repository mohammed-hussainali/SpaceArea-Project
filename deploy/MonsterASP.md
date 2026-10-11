# رفع Spaceara على MonsterASP

## سبب فشل تحديث قاعدة البيانات

1. **البناء كان يفشل (Build failed).** آخر commit أضاف تسجيل الدخول عبر Google في `Program.cs` بدون حزمة `Microsoft.AspNetCore.Authentication.Google`. أمر `Update-Database` يبني المشروع أولاً، فيتوقف قبل أن يصل لقاعدة البيانات. أُضيفت الحزمة إلى `Project.csproj` فقط، ولم يُعدَّل أي كود.
2. **سلسلة الاتصال الأصلية تشير إلى LocalDB**، وهو غير مثبت على الجهاز. النتيجة هي الخطأ `error: 52 - Unable to locate a Local Database Runtime installation`.
3. **MonsterASP يغلق الاتصال الخارجي بقاعدة البيانات افتراضياً**، ويشترط `TrustServerCertificate=True` في سلسلة الاتصال.

## خطوات الرفع

### 1. تجهيز قاعدة البيانات في لوحة MonsterASP

- افتح Databases، ثم قاعدة بياناتك، ثم **Users and remote**، واضغط **Enabled** لتفعيل Remote Access.
- انسخ من نفس الصفحة: Server و Database و Login و Password.

### 2. ملف إعدادات السيرفر

الملف `Project/appsettings.Production.json` يُقرأ على السيرفر فقط، ويُنشر تلقائياً مع الموقع. هو مستثنى من git لأن المستودع عام، حتى لا تصل كلمات السر إلى GitHub.

- **ConnectionStrings:** سلسلة اتصال MonsterASP.
- **SMTP:** بدونه لن يصل رمز التحقق عند التسجيل. Gmail يحتاج App Password، وليس كلمة سر الحساب.
- **Authentication:Google:** إن لم تكن لديك مفاتيح Google OAuth فاترك القيم كما هي. **لا تتركها فارغة**، وإلا ستعرض كل الصفحات خطأ 500.

نموذج الملف لمن ليس عنده نسخة منه:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=YOUR_DB_SERVER.public.databaseasp.net;Database=YOUR_DB_NAME;User Id=YOUR_DB_USER;Password=YOUR_DB_PASSWORD;Encrypt=True;TrustServerCertificate=True;MultipleActiveResultSets=True"
  },
  "SMTP": {
    "Host": "smtp.gmail.com",
    "Port": 587,
    "SenderEmail": "YOUR_EMAIL@gmail.com",
    "SenderName": "Spaceara",
    "Password": "YOUR_GMAIL_APP_PASSWORD"
  },
  "Authentication": {
    "Google": {
      "ClientId": "YOUR_GOOGLE_CLIENT_ID",
      "ClientSecret": "YOUR_GOOGLE_CLIENT_SECRET"
    }
  }
}
```

### 3. إنشاء الجداول على MonsterASP

اختر طريقة واحدة فقط.

**الطريقة الأولى: Visual Studio.** افتح Tools ثم NuGet Package Manager ثم Package Manager Console، وشغّل:

```powershell
Update-Database -Connection "Server=YOUR_DB_SERVER.public.databaseasp.net;Database=YOUR_DB_NAME;User Id=YOUR_DB_USER;Password=YOUR_DB_PASSWORD;Encrypt=True;TrustServerCertificate=True;MultipleActiveResultSets=True"
```

**الطريقة الثانية: SSMS.** اتصل بالسيرفر مع تفعيل Encrypt و Trust server certificate. اختر قاعدة بياناتك وشغّل الملف `deploy/database.sql`. السكربت آمن للتشغيل أكثر من مرة، لأنه يطبّق فقط الـ migrations غير الموجودة.

إذا ظهر الخطأ `There is already an object named 'AspNetRoles'` فالقاعدة فيها جداول من محاولة سابقة. إن لم تكن فيها بيانات حقيقية، احذف القاعدة وأنشئها من جديد من اللوحة، ثم أعد هذه الخطوة.

### 4. نشر الموقع

1. في لوحة MonsterASP فعّل حساب WebDeploy، ثم حمّل ملف `.publishSettings`.
2. في Visual Studio اضغط كليك يمين على المشروع، ثم Publish، ثم Import profile، واختر الملف، ثم Publish.
3. لا تفعّل خيار **Remove additional files at destination**. هذا الخيار يحذف ملفات المستخدمين المرفوعة داخل `wwwroot`، مثل السير الذاتية والتقارير والصور.
4. فعّل شهادة SSL المجانية للدومين من اللوحة.

### 5. قبل أي commit

لا ترفع كلمة سر MonsterASP إلى GitHub. لا تضع سلسلة الاتصال في `Project/appsettings.json`، بل احفظها على جهازك في User Secrets:

```bash
cd Project
dotnet user-secrets set "ConnectionStrings:DefaultConnection" "Server=YOUR_DB_SERVER.public.databaseasp.net;Database=YOUR_DB_NAME;User Id=YOUR_DB_USER;Password=YOUR_DB_PASSWORD;Encrypt=True;TrustServerCertificate=True;MultipleActiveResultSets=True"
```

بعدها يعمل `Update-Database` والتشغيل المحلي على قاعدة MonsterASP بدون تعديل أي ملف في المستودع.

## أخطاء شائعة

| الخطأ | السبب | الحل |
|---|---|---|
| `Build failed` | حزمة Google كانت ناقصة | تم إصلاحه في `Project.csproj` |
| `error: 52 - Unable to locate a Local Database Runtime` | الاتصال يشير إلى LocalDB | مرّر سلسلة MonsterASP عبر `-Connection` |
| `The certificate chain was issued by an authority that is not trusted` | شهادة MonsterASP ليست من جهة عامة | أضف `TrustServerCertificate=True` |
| `A network-related or instance-specific error` أو Timeout | Remote Access مغلق | فعّله من اللوحة |
| `There is already an object named ...` | جداول من محاولة سابقة | أعد إنشاء القاعدة ثم طبّق من جديد |
| كل الصفحات 500 مع `Value cannot be null. (Parameter 'ClientId')` | مفاتيح Google فارغة | ضع قيماً غير فارغة في `appsettings.Production.json` |
| التسجيل يفشل عند إرسال الرمز | إعدادات SMTP ناقصة أو خاطئة | عبّئ SMTP بـ App Password من Gmail |

## بعد إضافة أي migration جديدة

أعد توليد السكربت من مجلد المستودع. يحتاج ذلك أداة `dotnet-ef`، وتُثبَّت مرة واحدة بالأمر `dotnet tool install --global dotnet-ef`.

```bash
dotnet ef migrations script --idempotent -p Project -o deploy/database.sql
```

السكربت الناتج يعمل مباشرة في SSMS. عند تشغيله عبر `sqlcmd` أضف الخيار `-I`، لأن بعض الـ indexes تحتاج `QUOTED_IDENTIFIER ON`.
