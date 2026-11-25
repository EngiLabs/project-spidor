<div align="center" style="text-align: center;">

# SPIDOR

###### (Sensory Processing Integrated Droid with Omni-directional Reaction)


<img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue" alt="Python3">
<img src="https://img.shields.io/badge/fastapi-109989?style=for-the-badge&logo=FASTAPI&logoColor=white" alt="FastAPI">
<img src="https://img.shields.io/badge/OpenCV-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white" alt="OpenCV">
<img src="https://img.shields.io/badge/Needle_3-10B981?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0id2hpdGUiPjxwYXRoIGQ9Ik0yMS4yIDIuOGEyLjggMi44IDAgMCAwLTQgMEwzLjUgMTguNmwtLjggMy4xYS41LjUgMCAwIDAgLjYuNmwzLjEtLjhMMjEuMiA2LjhhMi44IDIuOCAwIDAgMCAwLTR6bS0yLjMgMS40YTEgMSAwIDAgMSAxLjQgMS40bC0yLjEgMi4xLTEuNC0xLjQgMi4xLTIuMXoiLz48L3N2Zz4%3D" alt="Needle 3">
<img src="https://img.shields.io/badge/Aiogram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" alt="Aiogram">
<img src="https://img.shields.io/badge/Arduino-00979D?style=for-the-badge&logo=arduino&logoColor=white" alt="Arduino">
<img src="https://img.shields.io/badge/Raspberry%20Pi-A22846?style=for-the-badge&logo=raspberrypi&logoColor=white" alt="Raspberry Pi">

###### Futuristisches Konzeptblatt eines Roboter-Vierbeiners.
###### ФАКТ МФТИ
</div>

<img src="/media/1.webp" width=125 align="left" style="float: left; margin-right: 8px;" alt="sticker">

Четвероногий шагающий робот (квадропод) с интегрированным грузовым отсеком и возможностью автономного выполнения
навигационных задач внутри помещений. 

Проект представляет собой платформу грузоподъемностью до 0.5 кг, способную перемещаться по командам, ориентируясь по
данным технического зрения и массива ИК-датчиков, с автоматическим возвратом на зарядную станцию.

---

## Архитектура проекта

<img src="/media/2.webp" width=105 align="left" style="float: left; margin-right: 8px;" alt="sticker">

Инновационность системы заключается в разделении вычислительных нагрузок.

Архитектура проекта состоит из трех основных узлов (сервисов), в каждом

из которых происходят параллельные обработка и реакция:

* **"Спинной мозг" (Arduino Uno + Servo Shield)**

    Отвечает за низкоуровневое управление в реальном времени. Генерирует PWM-сигналы для 12 сервоприводов (по 3 DOF на
каждую из 4 ног), опрашивает IMU-сенсор для динамической балансировки и проводит первичную фильтрацию показаний
ИК-датчиков расстояния.


* **"Головной мозг" (Raspberry Pi 3)**

    Микрокомпьютер на борту дроида. Обрабатывает задачи высшего уровня: локальное построение пути, распределение задач,
управление подсистемами, а также маршрутизация данных и фильтрация входящих команд от удаленного сервера.


* **"Para-RAID" (Канал связи с удалённым сервером-ядром)**

    Представляет собой direct RTC-канал связи с вычислительным узлом для ресурсоемких задач. Сервер принимает телеметрию
и видеопоток с оптической камеры дроида, использует модели компьютерного зрения для распознавания окружения и
прокладывания глобального маршрута, а также применяет компактную модель Needle 3.0 (с русскоязычным LoRA-дообучением
под команды проекта) для преобразования текстовых обращений пользователя в структурированные вызовы `RaidAPI` и отправки
команд управления на Raspberry Pi.



## Сервисы

<img src="/media/3.webp" width=125 align="left" style="float: left; margin-right: 8px;" alt="sticker">

Исходный код разделен на три основных сервиса и отдельный репозиторий дообучения модели:
*   [SPInal cDOR](https://github.com/EngiLabs/SPInal-cDOR)
*   [SPIDOR Neocortex](https://github.com/EngiLabs/SPIDOR-neocortex)
*   [Para-RAID Neural Link](https://github.com/EngiLabs/Para-RAID)
*   [Para-RAID Needle LoRA](https://github.com/EngiLabs/Para-RAID-needle-LoRA) — пайплайн русскоязычного LoRA-дообучения Needle 3 под команды SPIDOR

---

<table align="center">
  <tr>
    <td align="center">
      <a href="https://github.com/EichhorniaCrassipes">
        <img src="https://github.com/EichhorniaCrassipes.png" width="100px;" alt="EichhorniaCrassipes">
      </a><br>
      <a href="https://github.com/EichhorniaCrassipes">@EichhorniaCrassipes</a>
    </td>
    <td align="center">
      <a href="https://github.com/ArsenyKenunen">
        <img src="https://github.com/ArsenyKenunen.png" width="100px;" alt="ArsenyKenunen"/>
      </a><br>
      <a href="https://github.com/ArsenyKenunen">@ArsenyKenunen</a>
    </td>
    <td align="center">
      <a href="https://github.com/GriB28">
        <img src="https://github.com/GriB28.png" width="100px;" alt="GriB28">
      </a><br>
      <a href="https://github.com/GriB28">@GriB28</a>
    </td>
  </tr>
</table>
