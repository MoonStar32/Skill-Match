class Question {
  final String text;
  final List<Option> options;

  Question({
    required this.text,
    required this.options,
  });
}

class Option {
  final String text;
  bool isActive;
  final int weight;
  Option({
    this.isActive = false,
    required this.text,
    this.weight = -1,
  });
}

final allQuestions = [
  basicsQuestions,
  jSQuestions,
  sPAQuestions,
  endQuestions,
];

final endQuestions = [
  Question(
    text: 'Что делает браузер при запросе страницы?',
    options: [
      Option(text: 'запрашивает ресурсы, указанные в документе', weight: 1),
      Option(text: 'исполняет JS', weight: 1),
      Option(text: 'парсит документ', weight: 1),
      Option(text: 'строит DOM', weight: 1),
      Option(text: 'рендерит страницу', weight: 1),
    ],
  ),
];

final basicsQuestions = [
  Question(
    text: 'Что делает браузер при запросе страницы?',
    options: [
      Option(text: 'запрашивает ресурсы, указанные в документе', weight: 1),
      Option(text: 'исполняет JS', weight: 1),
      Option(text: 'парсит документ', weight: 1),
      Option(text: 'строит DOM', weight: 1),
      Option(text: 'рендерит страницу', weight: 1),
    ],
  ),
  Question(
    text: 'Какие из нижеприведенных элементов являются блочными?',
    options: [
      Option(text: 'article', weight: 1),
      Option(text: 'div', weight: 1),
      Option(text: 'form', weight: 1),
      Option(text: 'li', weight: 1),
      Option(text: 'a'),
      Option(text: 'img'),
      Option(text: 'span'),
      Option(text: 'button'),
    ],
  ),
  Question(
    text: 'Каких html элементов нет в спецификации html5?',
    options: [
      Option(text: 'src', weight: 1),
      Option(text: 'addr', weight: 1),
      Option(text: 'window', weight: 1),
      Option(text: 'document', weight: 1),
      Option(text: 'menu'),
      Option(text: 'portal'),
      Option(text: 'noscript'),
    ],
  ),
  Question(
    text: 'Выберите некорректные css селекторы.',
    options: [
      Option(text: 'div:hidden', weight: 1),
      Option(text: 'div - p', weight: 1),
      Option(text: ':nth-of-type(div)', weight: 1),
      Option(text: '[data-test="test"]'),
      Option(text: '[data-test|="test"]'),
      Option(text: 'div > p'),
      Option(text: '*'),
    ],
  ),
  Question(
    text: 'Какие метрики есть в Chrome?',
    options: [
      Option(text: 'FCP', weight: 1),
      Option(text: 'TTI', weight: 1),
      Option(text: 'TBT', weight: 1),
      Option(text: 'LCP', weight: 1),
      Option(text: 'LCS', weight: 1),
      Option(text: 'PID'),
    ],
  ),
];

final jSQuestions = [
  Question(
    text: 'Выберите корректные способы создания объекта в JS.',
    options: [
      Option(text: 'new Object({})', weight: 1),
      Option(text: 'Object.create(Object.prototype, {})', weight: 1),
      Option(text: 'Object.fromEntries([])', weight: 1),
      Option(text: 'new {}'),
      Option(text: '(function () { return Object; })()'),
      Option(text: 'new Object.prototype({})'),
    ],
  ),
  Question(
    text: 'Выберите методы по работе с асинхронным кодом в JS.',
    options: [
      Option(text: 'Promise', weight: 1),
      Option(text: 'async/await', weight: 1),
      Option(text: 'генераторы', weight: 1),
      Option(text: 'мьютексы'),
      Option(text: 'короутины'),
      Option(text: 'замыкания'),
      Option(text: 'каррирования'),
    ],
  ),
  Question(
    text:
        "Через сколько секунд выведется сообщение 'MSG' в консоль: Promise.resolve(() => console.log('MSG')).then(msg => setTimeout(() => (console.error('Error'), msg()), msg.toString().length * 1000))?",
    options: [
      Option(text: 'выведется ошибка', weight: 1),
      Option(text: '24 секунды', weight: 1),
      Option(text: 'мгновенно'),
      Option(text: 'сообщение не выведется'),
      Option(text: '3 секунды'),
      Option(text: '8 секунд'),
      Option(text: '1 секунда'),
    ],
  ),
  Question(
    text:
        'Какая переменная будет использоваться при выводе в консоль: var a = 5; { var a = 5; console.log(a); }',
    options: [
      Option(text: 'глобальная', weight: 1),
      Option(text: 'локальная'),
      Option(text: 'выведет ошибку'),
      Option(text: 'ничего не выведется'),
    ],
  ),
  Question(
    text: 'Какими способами можно получить DOM объект в JS?',
    options: [
      Option(text: 'document.getElementById()', weight: 1),
      Option(text: 'document.getElementsByClassName()', weight: 1),
      Option(text: 'document.getElementsByName()', weight: 1),
      Option(text: 'Ldocument.querySelectorAll()P', weight: 1),
      Option(text: 'document.getElementsByTag()'),
      Option(text: 'document.getElementsBySelection()'),
      Option(text: 'document.querySelectr()'),
    ],
  ),
  Question(
    text: 'Как проверить является ли объект obj из iframe JS массивом?',
    options: [
      Option(text: 'Array.isArray(obj)', weight: 1),
      Option(text: 'obj instanceof Array'),
      Option(text: 'obj.length'),
      Option(text: "typeof obj === 'array'"),
      Option(text: 'obj.isArray()'),
    ],
  ),
  Question(
    text:
        "Необходимо вытягивать из объекта собственное свойство по строке вида 'prop1.prop2.prop3'. Какие методы ты бы использовал для решения этой задачи?",
    options: [
      Option(text: 'reduce', weight: 1),
      Option(text: 'split', weight: 1),
      Option(text: 'hasOwnProperty', weight: 1),
      Option(text: 'slice'),
      Option(text: 'keys'),
      Option(text: "values"),
      Option(text: 'concat'),
      Option(text: 'filter'),
      Option(text: 'find'),
    ],
  ),
  Question(
    text: "Какие существуют способы регистрации функции в очередь микрозадач?",
    options: [
      Option(text: 'Promise.then', weight: 1),
      Option(text: 'queueMicrotask', weight: 1),
      Option(text: 'Promise.resolve'),
      Option(text: 'Promise.reject'),
      Option(text: "setTimeout"),
      Option(text: 'setInterval'),
      Option(text: 'requestIdleCallback'),
      Option(text: 'requestAnimationFrame'),
    ],
  ),
  Question(
    text: "Какие есть способы получить значение свойства объекта по ключу?",
    options: [
      Option(text: '[]', weight: 1),
      Option(text: '.', weight: 1),
      Option(text: 'destruct', weight: 1),
      Option(text: 'spread'),
      Option(text: "?"),
      Option(text: '>>>'),
      Option(text: 'get'),
    ],
  ),
  Question(
    text: "В каких случаях передача осуществляется по значению?",
    options: [
      Option(text: 'let a = 5; fn(a);', weight: 1),
      Option(text: "let a = '5'; fn(a);", weight: 1),
      Option(text: 'let a = { a: 5 }; fn(a.a);', weight: 1),
      Option(text: 'let { a } = { a: 5 }; fn(a);', weight: 1),
      Option(text: 'let [ a ] = [ 5 ]; fn(a);', weight: 1),
      Option(text: 'let a = Object(5); fn(a);'),
      Option(text: "let a = { a: 5 }; fn(a);"),
      Option(text: 'let a = [ 5 ]; fn(a);'),
    ],
  ),
];

final sPAQuestions = [
  Question(
    text: 'Какие алгоритмы использует Ангуляр?',
    options: [
      Option(text: 'инкрементальный дом', weight: 1),
      Option(text: 'shadow дом'),
      Option(text: 'виртуальный дом'),
      Option(text: 'виртуальная машина'),
    ],
  ),
  Question(
    text: 'Какие механизмы есть в Ангуляре из коробки?',
    options: [
      Option(text: 'IoC контейнеры', weight: 1),
      Option(text: 'реактивность', weight: 1),
      Option(text: 'CD', weight: 1),
      Option(text: 'централизованное управление состоянием'),
      Option(text: 'хуки'),
    ],
  ),
  Question(
    text: "Какие механизмы есть в Реакте из коробки?",
    options: [
      Option(text: 'хуки', weight: 1),
      Option(text: 'CD', weight: 1),
      Option(text: 'IoC контейнеры'),
      Option(text: 'реактивность'),
      Option(text: 'централизованное управление состоянием'),
    ],
  ),
  Question(
    text:
        'Какие существуют методы оптимизации Ангуляр приложений (по любой из метрик)?',
    options: [
      Option(text: 'SSR', weight: 1),
      Option(text: 'code splitting', weight: 1),
      Option(text: 'уменьшение количества ререндеров', weight: 1),
      Option(text: 'мемоизация', weight: 1),
      Option(text: 'глобальное хранилище'),
      Option(text: 'Renderer пакет'),
      Option(text: 'директивы'),
      Option(text: 'реактивность'),
    ],
  ),
  Question(
    text: "Какой результат операции map(a => a**2) на '---3-^2---1-|'?",
    options: [
      Option(text: '4, 1', weight: 1),
      Option(text: '9, 4, 1'),
      Option(text: '9, 8, 1'),
      Option(text: '1, 8, 9'),
      Option(text: 'ошибка'),
    ],
  ),
];
