Para criar o projeto:

```bash
flutter create viagem_guiada
$ cd viagem_guiada
$ code . # para abrir o Visual Studio Code no diretÃ³rio do projeto
$ flutter run
```

- [x] Criar diretÃ³rio para imagens (assests)
- [ ] Criar diretÃ³rio `src` e dentro dele `models, pages, partials`
- [ ] Apagar todo o conteÃºdo do arquivo principal (`lib/main.dart`)

**No arquivo `pubspec.yaml`**

- [ ] Inserir diretório de assets
- [ ] inserir dependências `provider: ^3.0.0` e  `http: ^0.12.0+4`

```yaml
Usar ` provider: ^4.3.3`
#setar parâmetro => listen:false
Provider.of<T>(context,listen:false)
```

**Projeto terá**

rotas nomeadas
provider


## Referências

- [**pub.dev** - The official package repository for Dart and Flutter apps](https://pub.dev/)
- [**Flutter app crash after converting Provider 3 to 4**](https://stackoverflow.com/questions/59590673/flutter-app-crash-after-converting-provider-3-to-4)