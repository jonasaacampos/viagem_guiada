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
   2. Requer JDK configurado ou;
   3. acesse o diretório binário do Android Studio  `cd C:\Program Files\Android\Android Studio\jre\bin` e rode o comando do passo 1.
   4. preencha os dados da chave
3. Crie o arquivo `key.properties`  dentro do diretório `android`
   1. Preecher com os dados padrão, e manter fora do controle de versão 
   
   ```porperties
      storePassword=suaSenha
      keyPassword=suaSenha
      keyAlias=key
      storeFile=seuCaminho/arquivoChave.jks
   ```

4. configurar o `android/app/bild.gradle`
   1. Antes do trecho `android {...`, inserir uma função para utilizarmos nosso arquivo de chave
   2. Alterar `signingConfig signingConfigs.debug` para `signingConfig signingConfigs.release`
   3. Inserir informações de confirmação de assinatura antes do trecho de `buildTypes {...`

```java
  signingConfigs {
        release {
            keyAlias keystoreProperties['keyalias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['keyPassword']
        }
    }
```

5.  Limpar o cache do aplicativo com `flutter clean` 
6.  Alterar o `android/app/src/main/AndroidManifest.xml` e preencher as tags:
    1.  `package`
    2.  `<uses-permission android:name="android.permission.INTERNET"/>` inserir permissões que se aplicam
    3.  `application android:label`
7.  Alterar o `android/app/bild.gradle` nos itens
    1.  `defaultConfig` = preencher com o mesmo nome do package do passo anterior
    2.  Alterar a versão no arquivo `local.properties` caso se aplique
8.  Criar o bundle (antigo apk)
    1.  `flutter build appbundle`




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