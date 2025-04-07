skill watchdog v0.2 by Chuck Chargin Jr.

WARNING:  If you are currently using version 0.1 of
          skill watchdog please read the Known Issues!

----------------------------------
What is this?
skill watchdog is a function I wrote for Silent Storm.
Basically it sits in the background and waits for your
troops to level up.  When a troop does level up the
function activates and examines their skills.  If any
skill is found to be lower than what it should be for
the troops level then it will be adjusted.

Oh and skill watchdog is a hack, not a patch.

----------------------------------
whats new:
- Added a little randomness to the slope so 2 troops
  of the same class won't always have exactly the same
  stats.  Skills will never be reduced, they will be
  increased or left alone.
- Added swdaction variable.  Setting swdaction in the
  console will let you force skill watchdog to take
  specific actions.
- Due to some oddities at the base skill watchdog 0.2 will
  not run there.  If you really need it to run at the
  base use swdaction to force it to run.

----------------------------------
Installation:
Use at your own risk.

This function has only been tested on US version 1.2 of
Silent Storm.  

To install the watchdog you first need to open
up the following file (make a backup first!):

\program files\jowood\silent storm\scripts\common.l

then copy and paste the contents of watchdog.l
at the bottom of common.l

If you are using wordpad make sure "save as type" is "text document"

Once installed the function will run in all new and saved
games.  See Known Issues for more info.

-------------------------------
Usage:
Skill watchdog runs every 60 seconds.  If a troop has gone up
a level since the watchdog has last run it will notice the
change and update the troops skills.  So basically just forget about it, it will do the work for you.

Using swdaction:
To use swdaction you have to have the console enabled.

In the console type: @swdaction = x
where x is:
10 = forces an update of the skills of your hero
11 = forces an update of the skills of troop 1
12 = forces an update of the skills of troop 2
13 = forces an update of the skills of troop 3
14 = forces an update of the skills of troop 4
15 = forces an update of the skills of troop 5
16 = forces an update of the skills of troop 6
     (note: you only get a troop 6 on certain levels)
17 = forces an update of the skills of troops 1 to 6
     (does not force an update of your hero)

Setting swdaction to any other number will force a normal
check for level up.  This is only useful if you want to
force skill watchdog to run at the base.

---------------------------------
Known issues:
-If you have a save game with an older version of watchdog
 then the OLDER version will be running at your base.  It
 appears that all variables and scripts are saved with the base
 the first time you visit it.  This only affects the base.
 Skill watchdog 0.2 will be running at camp sites and in
 missions.  I highly recommend that you not use skill watchdog
 0.2 with a save game that already has 0.1 running.
-If you have a save game with no previous version of watchdog
 running then you will not be able to use swdaction at the
 base at all.  Work around: go to a camp site and use
 swdaction there.
-If a troop levels up while a skill is reduced 
 (maybe from taking heavy damage) and skill watchdog runs
 there is a possiblity that after healing that skill will
 be lower than before the skill reduction.  A work around
 is to use swdaction to force an update for the troop after
 the skill reducing condition is removed.
-It is possible for troops to level up on the global and area
 maps.  If this happens you should wait for skill watchdog to
 run before leaving the map.  If you do leave before it runs
 then you must use swdaction to force the skill update.

---------------------------------
Interesting stuff:
Thanks to Bandures at the Nival forums we know that the absolute
fastest that a skill can increase is 0.1 points per use.  For
a classes primary skill (i.e. soldier = shooting) that means
10 uses will raise the skill by 1 point.

According to the data I have collected from setxplevel a classes
main skill should progress about 7 points per level.

That means a soldier would have to fire a gun 70 times every
level in order to stay on the slope for their class.  Now for
a soldier in this game that might be possible.  Medics and
engineers will have a tougher time using their special skills
70 time per level!

------------------------------
Thanks:
Thanks to sthall for his help in testing this function.

Thanks to all at the Nival forums for your compliments
and especially the large amount of information you have
accumulated on this game.
------------------------------
Questions:
Any problems or questions you can e-mail me at
cchargin@comcast.net

The enclosed spreadsheet can be used to calculate
your own slopes.

cchargin





-----Переведено с помощью chatGPT в 2025 году-----

Skill Watchdog v0.2 от Chuck Chargin Jr.

ВНИМАНИЕ: Если вы используете версию 0.1 Skill Watchdog, пожалуйста, прочтите раздел «Известные проблемы»!
Что это такое?

Skill Watchdog — это функция, которую я написал для Silent Storm.
По сути, она работает в фоновом режиме и ожидает, когда ваши бойцы повысят уровень.
Когда это происходит, функция активируется и проверяет их навыки.
Если какой-либо навык оказывается ниже того, каким он должен быть на этом уровне, он корректируется.

Skill Watchdog — это хак, а не патч.
Что нового:

   Добавлена небольшая случайность в прогрессию навыков, чтобы бойцы одного класса не имели абсолютно одинаковых характеристик.
Навыки никогда не уменьшаются, только увеличиваются или остаются без изменений.

   Добавлена переменная swdaction. Если задать её в консоли, можно заставить Skill Watchdog выполнить конкретные действия.

   Из-за некоторых особенностей механики Skill Watchdog 0.2 не работает на базе. Если вам нужно запустить его на базе, используйте swdaction.

Установка:

Используйте на свой страх и риск.
Эта функция была протестирована только на американской версии 1.2 Silent Storm.

Чтобы установить Skill Watchdog:

   Откройте следующий файл (сначала сделайте резервную копию!):
   ...\Silent Storm\scripts\common.l

   Скопируйте содержимое файла watchdog.l и вставьте его в конец common.l.

   Если используете WordPad, убедитесь, что выбрали "Сохранить как" → "Текстовый документ".

После установки Skill Watchdog будет работать во всех новых и сохранённых играх. Дополнительную информацию см. в разделе «Известные проблемы».
Использование:

Skill Watchdog запускается каждые 60 секунд. Если персонаж повысил уровень с момента последнего запуска, его навыки будут обновлены.
Проще говоря, вам ничего не нужно делать — функция работает автоматически.
Использование swdaction:

Для использования swdaction необходимо включить консоль.

Введите в консоли:
swdaction = X
где X — это:
   10 – обновляет навыки вашего героя
   11 – обновляет навыки бойца 1
   12 – обновляет навыки бойца 2
   13 – обновляет навыки бойца 3
   14 – обновляет навыки бойца 4
   15 – обновляет навыки бойца 5
   16 – обновляет навыки бойца 6 (на некоторых уровнях)
   17 – обновляет навыки бойцов 1–6 (но не героя)

Любое другое значение swdaction вызовет обычную проверку повышения уровня. Это полезно, если вам нужно принудительно запустить Skill Watchdog на базе.
Известные проблемы:

   Если у вас сохранение с версией 0.1, старая версия будет работать на базе, так как все переменные
и скрипты сохраняются при первом посещении. Skill Watchdog 0.2 будет работать в лагерях и на миссиях, но не на базе.
Не рекомендуется использовать 0.2 с сохранениями, где уже работала 0.1.

   Если в сохранении никогда не использовался Skill Watchdog, то swdaction не будет работать на базе. Обходное решение: перейдите в лагерь
 используйте swdaction там.

   Если боец повышает уровень во время временного снижения навыка (например, из-за серьёзных ранений), навык после лечения может оказаться ниже,
чем был до снижения. Обходное решение: после выздоровления используйте swdaction для обновления навыка.

   Иногда бойцы могут повышать уровень на глобальной или тактической карте. Если это произошло, подождите, пока Skill Watchdog
выполнит обновление, прежде чем покинуть карту. Если вы уйдёте раньше, используйте swdaction, чтобы принудительно обновить навыки.

Интересные факты:

Благодаря пользователю Bandures с форумов Nival мы знаем, что максимальный прирост навыка составляет 0.1 очка за одно использование.
Для основного навыка класса (например, стрельба для солдата) это означает, что 10 использований поднимут навык на 1 очко.

Согласно данным из setxplevel, основной навык класса должен увеличиваться примерно на 7 очков за уровень.
Это значит, что солдат должен стрелять 70 раз на каждом уровне, чтобы поддерживать нормальный рост навыка.
Для солдатов это возможно, но медики и инженеры вряд ли смогут использовать свои особые навыки 70 раз за уровень!
Благодарности:

Спасибо sthall за помощь в тестировании!
Спасибо всем на форумах Nival за ваши советы и огромное количество собранной информации по игре.
Вопросы:

Если у вас есть вопросы или проблемы, пишите мне на cchargin@comcast.net.
Во вложенной таблице можно рассчитать собственные параметры прогрессии навыков.

Chuck Chargin



ПРИМЕЧАНИЕ по Часовым.
Коэффициенты роста навыков поправлены так, чтобы сделать автопрокачку навыков примерно на 10% ниже, чем дает команда setxplevel.
Это сделано намеренно, чтобы видеть красные плюсики в навыках, которые можно покачать или потратить немного денег для доведения до совершенства.
На 28 уровне персонажа это на 1-9 значений навыков ниже максимума.
И еще, значения настроены под определенные значения стартовых характеристик с которыми я играл. Если хотите их изменить, смотрите excel таблицу и подганяйте значения icp в скрипте под свои нужды.
