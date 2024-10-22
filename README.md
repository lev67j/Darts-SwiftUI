# Darts Score App

Pet-project по разработке мобильного приложения под iOS
- язык программирования: **Swift**;
- UI фреймворк: **SwiftUI**;
- целевая версия iOS: **16.0**;
- устройство, на котором тестировалось приложение: **iPhone 13 Pro Max (iOS 16.6)**;


## Суть приложения
Набрать как можно больше очков, правильно отвечая на вопросы о том, сколько очков выбито на мишени для дартса тремя дротиками. Приложение состоит из 3-х разделов:
1. Игра
1. Статистика
1. Настройки


## Раздел "Игра"

### Перед началом игры
При запуске приложения, по умолчанию открывается раздел **"Игра"**. Перед запуском новой игры пользователь видит следующую информацию:
- количество попыток для ответа;
- количество секунд на ответ.

Также пользователю отображается мишень для дартса, в котором будут показаны расположения дротиков - результаты попаданий при каждой попытке.

При нажатии на кнопку **"НАЧАТЬ"** начинается сама игра.


### В процессе игры
После нажатия на кнопку **"НАЧАТЬ"** пользователю показываются изображения дротиков, расположенные на мишени случайным образом. Таймер начинает обратный отчет (в секундах).

Под мишенью появляется вопрос на который нужно правильно ответить, выбрав один и вариантов ответа.

Количество очков - это сумма очков, которые "выбиты" дротиками на мишени. Каждый дротик может попасть в сектор как с очками, так и и без них - промах. Черная зона, в которой уже расположены числа с очками (после второго красно-зеленого ряда, если считать от центра) и есть зона промаха. Пользователю необходимо обращать внимание именно на наконечники дротиков для подсчета суммы "выбитых" очков.

При нажатии на любой из предложенных ответов (круглая кнопка бирюзового цвета с количеством очков), мишень делает 1 оборот вокруг своей оси, обновляются новые "попадания" дротиков и значения в кнопках для ответа. Также уменьшается количество попыток и перезапускается таймер

Если пользователь не успевает ответить за отведенное время, то приложение самостоятельно обновляет все данные, а попытка засчитывается как пропущенная. Если пользователь успел ответить, то, в зависимости от того правильно он ответил или нет, попытка засчитывается как правильная или ошибочная, и пользователь получает баллы или нет.


### Пауза и конец игры
Если пользователь в процессе игры перешел в другой раздел (**"Статистика"** или **"Настройки"**), то игра приостанавливается и сбрасывается до текущей попытки. То есть сохраняется прогресс игры.

При возвращении пользователя в раздел **"Игра"**, сбрасывается таймер и отображаются следующие кнопки:
- **"ПРОДОЛЖИТЬ"** - чтобы продолжить сохраненный прогресс.
- **"ЗАНОВО"** - чтобы удалить сохраненный прогресс и перейти в начальное состояние раздела - перед началом игры (см. первый скриншот).

После того как пользователь ответит на последнюю попытку (или истечет время) то выведется краткая информация о текущей игре - результаты. На полупрозрачной панели будет отображено:
- количество попыток;
- количество правильных ответов;
- количество неправильных ответов;
- количество пропущенных попыток (истекло время);
- количество набранных очков за ответы;
- общее потраченное время на все ответы.

В дополнение к этому в течении 20-30 секунд будет озвучена мелодия, разная для хорошего и плохого результата. Плохим будет считаться результат, когда количество неправильных ответов будет больше половины всех попыток.


## Раздел "Статистика"
### История игр
При переходе в данный раздел отображается таблица с краткой статистикой проведенных игр. Таблица содержит следующие колонки:
- **"Счет"** - количество очков, набранных в процессе ответов;
- **"Попытки"** - количество правильных ответов и общее количество попыток;
- **"Время"** - общее время (в секундах), потраченное на все попытки.

Все записи отсортированы в порядке убывания по количеству набранных очков.

Дополнительно наложен градиент: **ЗЕЛЕНЫЙ-ЖЕЛТЫЙ-КРАСНЫЙ**.

Каждая запись кликабельна и, при нажатии на любую запись, будет выполнен переход в подраздел **"История ответов"**.


### История ответов
В данном подразделе отображается вся информация по конкретной попытке в данной игре (запись, которую выбрал пользователь в разделе **"Статистика"**):
- мишень для дартса и расположение дротиков;
- варианты ответов с количеством "выбитых" очков дротиками;
- правильный ответ (отображается светло-зеленым цветом);
- неправильный ответ пользователя (отображается светло-красным цветом).

Неправильный ответ отображается только если пользователь допустил ошибку. В остальных случаях отображается правильный ответ и все остальные (бирюзового цвета).

Чтобы просмотреть информацию о других попытках, пользователю нужно свайпнуть в сторону (вправо или влево).


### Подробная статистика
При нажатии на кнопку **"Подробно"**, снизу появляется "шторка", в которой содержится подробная информация об игре и ответах пользователя.

Оранжевый блок информации показывает, какие настройки были выбраны для данной игры и общую по ней статистику:
- количество очков, набранных пользователем за всю игру;
- время, затраченное на все ответы;
- количество всех попыток;
- количество правильных ответов;
- количество попыток, на которые пользователь не успел ответить;
- дата - когда была игра.

Ниже перечислены блоки с информацией о каждой попытке:
- сектор, в который попал конкретный дротик;
- количество очков, выбитых каждым дротиком по отдельности;
- ответ пользователя;
- сколько времени пользователь потратил на каждую попытку;
- сколько очков пользователь получил за каждую попытку.

Пояснения к записям напротив строк "Попадание 1-3":
- **"20х1"** = 20 очков: дротик попал в сектор 20 с множителем 1 (цвет черный);
- **"20х2"** = 40 очков: дротик попал в сектор 20 с множителем 2 (цвет зеленый, узкое кольцо наибольшего диаметра);
- **"20х3"** = 40 очков: дротик попал в сектор 20 с множителем 3 (цвет зеленый, узкое кольцо среднего диаметра);
- **"25х1"** = 25 очков: дротик попал в сектор 25 (цвет зеленый, наименьшее кольцо, окружающее красный центр);
- **"50х1"** = 50 очков: дротик попал в сектор 50 (цвет красный, в яблочко);
- **"Промах"** = 0 очков: дротик попал в мишень за пределы очковой зоны (цвет черный).


## Раздел "Настройки"
### Общие настройки
В разделе **"Настройки"** пользователь может выполнить следующие действия:
- изменить количество попыток в игре;
- изменить время, которое дается на каждую попытку;
- перейти в настройки внешнего вида;
- перейти в настройки звуковых эффектов.

Все настройки, изменяемые пользователем, сохраняются глобально и при перезапуске не теряются. Стоит обратить внимание, что настройки конкретной игры сериализуются вместе со статистикой самой игры, и поэтому измененные настройки будут применены только с началом новой игры.


### Настройки внешнего вида
Данный подраздел предназначен для того, чтобы пользователь мог настроить то, как будут отображаться мишень и дротики во время игры и при просмотре статистики. Есть такие опции как:

выбрать понравившееся изображение дротика из предложенных;
- изменить размер дротика;
- включить или выключить возможность промахов.

При изменении каждой настройки, отображаемое представление мишени и дротиков будет обновляться.

Переключатель промахов намеренно добавлен именно в этот раздел, чтобы пользователю наглядно было продемонстрировано, что изменяет данная настройка.


### Звуковые настройки
Этот подраздел предназначен для управления громкостью звуковых эффектов с помощью ползунка.

При необходимости можно отключить конкретную мелодию или звуковой эффект.

При изменении громкости звука, обновляется кнопка на которой изображена картинка с динамиками. Эта кнопка позволяет по нажатию включить и выключить воспроизведение конкретной аудиозаписи.


## Полученные навыки
При создании данного приложения были приобретены новые навыки и отточены уже имеющиеся умения:

| № | Навыки/умения|
|---|---|
| 1| Разработка пользовательского интерфейса с использованием фреймворка **SwiftUI**|
| 2| Разработка приложения по архитектуре **MVVM**|
| 3| Использование свойств и модификаторов `SwiftUI`, таких как, `@Environment`, `@EnvironmentObject`, `@State`, `@StateObject`, `@ObservedObject` и `@Published` для управления данными и их обновлением в приложении|
| 4| Использование `Combine`|
| 5| Реализация навигации и переходов в приложении|
| 6| Сериализация игровых данных в **JSON** с применением протокола `Codable`|
| 7| Сохранение пользовательских настроек с использованием `UserDefaults` и `@AppStorage`|
| 8| Подключение и использование через **SPM** сторонних библиотек, например, **SwiftUIComponents4iOS**|
| 9| Реализация кастомных интерактивных компонентов `VGradientView`, `HWheelPickerView`, `HStepperView`, `HStaticSegmentedPickerView`, `BluredPopup` и использовние через пакет `SwiftUIComponents4iOS`|
|10| Реализация для стандартных UI-компонентов собственных стилей: `ImageToggleStyle` и `PrimaryButtonStyle`|
|11| Применение асинхронных вызовов функций (**Swift Concurrency**) для повышения отзывчивости приложения|
|12| Использование условия `#available` для проверки доступности API на определенной версии операционной системы и написания разной реализации в зависимости от выполнения условия|
|13| Польностью программное построение и отрисовка мишени для дартса из примитивов `Path` и `Text`|
|14| Работа с изображениями и звуком (`AVFoundation`)|
|15| Работа с анимациями и анимированными переходами|
|16| Добавление локализации приложения (на русский язык)|
|17| Оптимизация производительности приложения|
|18| Обработка исключений|
|19| Расширение функционала стандартных структур и классов через `extension`|
