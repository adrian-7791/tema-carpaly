# CarThemes – ghid pas cu pas (fara cunostinte tehnice)

Ai nevoie de: un calculator (Windows sau Mac), cablul iPhone-ului, un cont GitHub gratuit si contul tau Apple.

## Partea 1 – Pui proiectul pe GitHub (fara instalat nimic)
1. Intra pe https://github.com si fa-ti cont (sau logheaza-te).
2. Sus dreapta: "+" > "New repository". Nume: `CarThemes`. Alege **Public**. Apasa "Create repository".
3. Pe pagina noua apasa linkul "uploading an existing file".
4. Dezarhiveaza `CarThemes.zip` pe calculator. Trage **continutul** folderului (App, Shared, Widget, project.yml, .github ...) in fereastra GitHub. Asteapta sa se incarce si apasa "Commit changes".
5. Verifica: in repo trebuie sa vezi folderul `.github`. Daca NU apare (Mac-ul ascunde folderele cu punct):
   - "Add file" > "Create new file"
   - la nume scrie exact: `.github/workflows/build.yml`
   - deschide `build.yml` din arhiva (e si in radacina), copiaza tot textul si lipeste-l
   - "Commit changes".

## Partea 2 – GitHub compileaza aplicatia
1. In repo, tab-ul **Actions**. Daca cere, apasa "I understand my workflows, enable them".
2. Alege "Build IPA" in stanga > butonul "Run workflow" > "Run workflow".
3. Dupa 3-6 minute apare o bifa verde. Intra pe rulare si jos, la "Artifacts", descarca `CarThemes-ipa` (un zip). Dezarhiveaza-l: obtii `CarThemes.ipa`.
4. Daca e X rosu: copiaza-mi mesajul de eroare si il repar.

## Partea 3 – Instalezi pe iPhone
1. iPhone: Setari > Confidentialitate si securitate > **Mod dezvoltator** > pornit (reporneste telefonul).
2. Pe calculator instaleaza **Sideloadly** (sideloadly.io). Pe Windows instaleaza si iTunes + iCloud de pe site-ul Apple (nu din Microsoft Store).
3. Conecteaza iPhone-ul cu cablu si accepta "Trust this computer".
4. In Sideloadly: trage `CarThemes.ipa` in fereastra, scrie Apple ID-ul, apasa "Start", introdu parola.
5. iPhone: Setari > General > VPN si gestionare dispozitiv > contul tau > "Trust".
6. Deschide aplicatia "Car Themes". Apoi tine apasat pe ecranul principal > "+" > "Car Theme Widget". In CarPlay: personalizeaza ecranul de start si adauga widgetul.

## De stiut
- Cu cont Apple gratuit, aplicatia expira dupa 7 zile: o reinstalezi cu Sideloadly (aceleasi 4 pasi, 2 minute).
- Foloseste un Apple ID dedicat daca vrei sa fii prudent.
- iOS 27 beta: daca Sideloadly da eroare, spune-mi mesajul exact.
