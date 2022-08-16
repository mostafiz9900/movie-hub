abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "bn": bn,
    "te": te,
    "ur": ur,
    "hi": hi,
    "ta": ta,
    "es": es,
    "mr": mr,
    "ru": ru,
    "fr": fr
  };
}

final Map<String, String> enUS = {
  'greeting': 'Hello, How are you?',
  'day': "Awesome day...",
  "Setting": "Setting",
  "MovieList": "Movie List",
};

final Map<String, String> bn = {
  'greeting': 'হ্যালো, আপনি কেমন আছেন?',
  'day': "সন্ত্রস্ত দিন...",
  'Setting': "সেটিং",
  "MovieList": "সিনেমার তালিকা",
};
final Map<String, String> te = {
  'greeting': 'హలో, మీరు ఎలా ఉన్నారు?',
  'day': "గొప్ప రోజు...",
  'Setting': "అమరిక",
  "MovieList": "సినిమా జాబితా",
};
final Map<String, String> ur = {
  'greeting': 'ہیلو آپ کیسے ہیں؟',
  'day': "بہت اچھا دن ...",
  'Setting': "ترتیب",
  "MovieList": "فلم کی فہرست",
};
final Map<String, String> hi = {
  'greeting': 'नमस्ते आप कैसे हैं?',
  'day': "शानदार दिन...",
  'Setting': "स्थापना",
  "MovieList": "मूवी सूची",
};

final Map<String, String> ta = {
  'greeting': "வணக்கம் எப்படி இருக்கிறாய்?",
  'day': "அற்புதமான நாள் ...",
  'Setting': "அமைத்தல்",
  "MovieList": "திரைப்பட பட்டியல்",
};
final Map<String, String> es = {
  'greeting': "¿Hola como estas?",
  'day': "Día impresionante...",
  'Setting': "Agordo",
  "MovieList": "Filmide nimekiri",
};
final Map<String, String> mr = {
  'greeting': "हॅलो, कसे आहात",
  'day': "अप्रतिम दिवस ...",
  'Setting': "हालत",
  "MovieList": "चलचित्र सूची",
};
final Map<String, String> ru = {
  'greeting': "Привет как дела?",
  'day': "Замечательный день...",
  'Setting': "Параметр",
  "MovieList": "Список фильмов",
};
final Map<String, String> fr = {
  'greeting': "Salut comment allez-vous?",
  'day': "Super journée...",
  'Setting': "Paramètre",
  "MovieList": "Liste des films",
};
