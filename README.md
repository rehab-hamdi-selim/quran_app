# 📖 Quran App

A powerful and beautifully designed Flutter app for exploring Islamic content. The app is built using the MVC architectural pattern and features support for both Arabic and English languages. It includes daily prayer times, complete Quran surahs, Hadiths, and more — all accessible through an intuitive interface with dark and light modes.

## 📱 Features

- 🧭 Multi-page navigation with BottomNavigationBar
- 🌐 API integration for Quran, Hadith, and Prayer Times
- 🌙 Dark mode and ☀️ Light mode toggle
- 🌍 Multilingual support (Arabic & English) using `easy_localization`
- 🧱 Structured using MVC architecture
- ⚡ High performance with `dio` for HTTP requests

## 🖼️ Screens

- 🕋 Splash Screen with app intro
- 🕌 Prayer Times Page (displays accurate timings)
- 📜 Quran Surahs Page (tap a surah to view its Ayat)
- 📖 Hadith Page (lists Hadiths with details)
- 🔢 Tasbeeh Page (choose Azkar and count them)
- ⚙️ Settings Page (language switcher, theme toggle, etc.)

## 📷 Screenshots
- ![Splash Screen](https://github.com/user-attachments/assets/cf19b78f-6a81-4018-92ff-34874c688bf8)
- ![Prayer Times](https://github.com/user-attachments/assets/9e7410a1-c293-47d1-9d9b-59807994b6b4)
- ![Quran Surahs](https://github.com/user-attachments/assets/1b73f744-7691-4f87-a1ac-a3fddcde0d19)
- ![Quran Surah](https://github.com/user-attachments/assets/9d29a513-119c-42f6-bf86-46979aef8bb2)
- ![Hadith](https://github.com/user-attachments/assets/2b410261-71c1-428d-9672-41987f319ff3)
- ![Tasbeeh](https://github.com/user-attachments/assets/b74a88d6-badd-448a-a67e-8b6c227ff84b)

## 🛠️ Tech Stack

| Tool                | Use                                                   |
|---------------------|--------------------------------------------------------|
| Flutter             | Mobile app development framework                      |
| dio                 | For performing network requests                       |
| MVC                 | To separate UI from logic for better code management  |
| easy_localization   | To enable multi-language support (Arabic & English)   |                     
| bottom_navigation_bar | Navigation between main sections of the app         |

## 🚀 How It Works

1. When the app starts, a splash screen is shown.
2. Then, the main interface contains 5 navigable tabs:
   - **Prayer Times**: Shows the daily prayer schedule fetched from an API.
   - **Quran**: Displays a list of all surahs. Tapping on one opens its verses.
   - **Hadith**: Lists selected hadiths from an API.
   - **Tasbeeh**: Allows users to select Azkar and use a counter.
   - **Settings**: Allows switching between dark/light mode and Arabic/English.
3. All data (prayer times, Quran, hadiths) is fetched using APIs.

## 🌐 Localization

The app supports both Arabic and English using the `easy_localization` package. You can switch between languages from the settings screen.

## 🎨 Themes

Users can toggle between light and dark mode from the settings page. The selected mode is saved using shared preferences.

## 🧪 Getting Started

```bash
git clone https://github.com/rehab-hamdi-selim/quran-app.git
cd quran-app
flutter pub get
flutter run

## 📫 Contact
- Email: rehab.hamdy.selim@gmail.com
- LinkedIn: [www.linkedin.com/in/RehabSelim](https://www.linkedin.com/in/RehabSelim)
- GitHub: [@rehab-hamdi-selim](https://github.com/rehab-hamdi-selim)
