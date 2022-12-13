<p align="center">
<a href='https://github.com/jonasaacampos'><img src='https://img.shields.io/badge/feito%20com%20%E2%9D%A4%20por-jaac-cyan'></a>
<a href='https://www.linkedin.com/in/jonasaacampos'><img src='https://img.shields.io/badge/LinkedIn-Profile-informational?style=flat&logo=linkedin&logoColor=white&color=0D76A8'></a>
</p>

<p align="center">
   <a href='https://github.com/jonasaacampos'>
      <img alt="" src="https://img.shields.io/static/v1?color=blue&label=Flutter&message=Android&style=for-the-badge&logo=Flutter"/>
      </a>
</p>

<h1>Viagem Guiada: Destinos reais para histórias imaginadas</h1>

<img alt="logo desc..." src="lib\assets\design-source\1024.png" width=150 align=right>

![](https://img.shields.io/badge/dart-informational?style=flat&logo=dart&logoColor=white&color=grey)
![](https://img.shields.io/badge/flutter-informational?style=flat&logo=flutter&logoColor=white&color=blue)
![](https://img.shields.io/badge/android-informational?style=flat&logo=android&logoColor=white&color=green)

> Aplicativo de uma agência de viagens que sugere destinos que foram citados em livros. Um incentivo à viagem e à leitura.

-------------

<h2>Índice de Navegação</h2>

<!-- TOC -->

- [1. Ambiente de Desenvolvimento](#1-ambiente-de-desenvolvimento)
  - [1.1. Para criar o projeto:](#11-para-criar-o-projeto)
  - [1.2. Para rodar o projeto](#12-para-rodar-o-projeto)
- [2. Deploy](#2-deploy)
- [3. Referências](#3-referências)
  - [3.1. Créditos dos textos e imagens](#31-créditos-dos-textos-e-imagens)
  - [3.2. Agradecimentos](#32-agradecimentos)
- [4. Contato](#4-contato)

<!-- /TOC -->

## 1. Ambiente de Desenvolvimento

### 1.1. Para criar o projeto:

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

### 1.2. Para rodar o projeto

`flutter run`

## 2. Deploy

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
9.  Caso tudo ocorra bem, o arquivo compilado estará em `build\app\outputs\bundle\release\app-release.aab`

## 3. Referências

- [**pub.dev** - The official package repository for Dart and Flutter apps](https://pub.dev/)
- [**Flutter app crash after converting Provider 3 to 4**](https://stackoverflow.com/questions/59590673/flutter-app-crash-after-converting-provider-3-to-4)
- [**Android Icon Generator**](https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=clipart&foreground.clipart=android&foreground.space.trim=1&foreground.space.pad=0.25&foreColor=rgba(96%2C%20125%2C%20139%2C%200)&backColor=rgb(68%2C%20138%2C%20255)&crop=0&backgroundShape=circle&effects=none&name=ic_launcher) (Usar esta ferramenta, e salvar o arquivo como `ic_launcher` facilita para substituição do ícone padrão.)
- [Build and release an Android app](https://docs.flutter.dev/deployment/android)
- [Google Play Console](https://play.google.com/console)

### 3.1. Créditos dos textos e imagens

- https://turismo.ig.com.br/destinos-nacionais/2018-04-18/destinos-classicos-literatura.html
- https://companhiadeviagem.blogosfera.uol.com.br/2016/06/29/cidades-e-roteiros-literarios-para-viajar-alem-das-paginas-dos-livros/
- FreePick

### 3.2. Agradecimentos

Romi Matos, Zilene, Rosi Maria e clube de leitores de Maringá.

-----
<!-- CONTACT -->

## 4. Contato

**Author:** Jonas Araujo de Avila Campos

<p align='center'>
  <a href='https://github.com/jonasaacampos'>
    <img src='https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white'/>
  </a>
  <a href='https://www.linkedin.com/in/jonasaacampos/'>
    <img src='https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white'/>
  </a>
</p>