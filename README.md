### Para criar o projeto:

```bash
flutter create viagem_guiada
$ cd viagem_guiada
$ code . # para abrir o Visual Studio Code no diretório do projeto
```

- [x] Criar diretório para imagens (assests)
- [x] Criar diretório `src` e dentro dele `models, pages, partials`
- [x] Apagar todo o conteúdo do arquivo principal (`lib/main.dart`)

**No arquivo `pubspec.yaml`**

- [x] Inserir diretório de assets
- [x] inserir dependências `provider: ^3.0.0` e  `http: ^0.12.0+4`

```yaml
Usar ` provider: ^4.3.3`
#setar parâmetro => listen:false
Provider.of<T>(context,listen:false)
```

### Para rodar o projeto

`flutter run`

## Deploy

1. Criar um ícone descence e substituir os ícones default (`android/app/src/main/res = > todos os ícones`)
2. Criar uma assinatura digital do projeto 
   1. `keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload`
   2. Requer JDK configurado




## Referências

- [**pub.dev** - The official package repository for Dart and Flutter apps](https://pub.dev/)
- [**Flutter app crash after converting Provider 3 to 4**](https://stackoverflow.com/questions/59590673/flutter-app-crash-after-converting-provider-3-to-4)
- [**Android Icon Generator**](https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=clipart&foreground.clipart=android&foreground.space.trim=1&foreground.space.pad=0.25&foreColor=rgba(96%2C%20125%2C%20139%2C%200)&backColor=rgb(68%2C%20138%2C%20255)&crop=0&backgroundShape=circle&effects=none&name=ic_launcher) (Usar esta ferramenta, e salvar o arquivo como `ic_launcher` facilita para substituição do ícone padrão.)
- [Build and release an Android app](https://docs.flutter.dev/deployment/android)

### Créditos dos textos e imagens

- https://turismo.ig.com.br/destinos-nacionais/2018-04-18/destinos-classicos-literatura.html
- https://companhiadeviagem.blogosfera.uol.com.br/2016/06/29/cidades-e-roteiros-literarios-para-viajar-alem-das-paginas-dos-livros/
- FreePick

### Agradecimentos

Romi Matos, Zilene, Rosi Maria e clube de leitores de Maringá.