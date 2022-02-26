# GloboID SDK
[![Build Status](https://img.shields.io/bitrise/3c3a276fda2262c5/master?token=2wpOpGQbZdvOg499Y1H4YA)](https://app.bitrise.io/app/728cef72db5a84cf)
[![Version](https://img.shields.io/badge/version-3.2.0-beta.1-beta.1-beta.2-beta.1-blue.svg?style=flat)](https://github.com/globoi/globoid-sdk-ios)
[![Platform](https://img.shields.io/badge/platform-iOS%2010.0+-lightgrey.svg?style=flat)](https://github.com/globoi/globoid-sdk-ios)

## Requisitos
- **1.** Ter acesso ao repositório do *GloboID SDK* na **Globo.com** (chave SSH).
- **2.** Ter uma aplicação iOS criada no *Facebook*.
- **3.** Ter uma aplicação iOS criada no *Firebase* e estar em posse do arquivo `GoogleService-Info.plist`.
- **4.** O *GloboID SDK* está disponível **somente** a partir do **iOS 10.0+**.


## Instalação
Sigas os passos abaixo para instalar *GloboID SDK* no seu projeto.


#### Passo 1. Instalar o *CocoaPods*
- **1.1** Instale o *CocoaPods* no seu projeto.

Caso nunca tenha feito isso antes, [siga estes passos](https://cocoapods.org).


#### Passo 2. Instalar o *GloboID SDK* via *CocoaPods*
- **2.1** Adicione as seguintes linhas ao arquivo *Podfile* do seu projeto:

```
source 'https://github.com/CocoaPods/Specs.git'
source "https://github.com/globoi/pods-repository"
 
pod "GloboIDSDK"
```

- **2.2** Pelo *Terminal*, navegue até a pasta do seu projeto que contém o arquivo *Podfile*.
- **2.3** Digite o comando **pod install**.

Isso vai instalar o *GloboID SDK* e todas suas dependências.

Também será criado o arquivo *NomeDoSeuProjeto.__xcworkspace__*.

Você deve usar **somente este arquivo** para abrir seu projeto de agora em diante.


#### Passo 3. Configurar o *Facebook* no arquivo *Info.plist* do seu projeto
- **3.1** Crie uma chave de tipo *String* chamada **FacebookAppID** e adicione o *AppID* da sua aplicação iOS do Facebook.
- **3.2** Crie uma chave de tipo *String* chamada **FacebookDisplayName** e adicione o *Display Name* configurado no *App Dashboard* da sua aplicação iOS do Facebook.
- **3.3** Crie uma chave de tipo *String* chamada **FacebookUrlSchemeSuffix** e adicione o *sufixo* configurado no *App Dashboard* da sua aplicação iOS do Facebook. **Entrar em contato com o time GloboID da globo.com para adicionar esse sufixo na app do facebook**
- **3.4** Crie uma chave de tipo *Array* chamada **URL types**.
- **3.5** Crie uma chave de tipo *Dictionary* chamada **Item 0** dentro de **URL types**.
- **3.6** Crie uma chave do tipo String **URL identifier** com o bundle identifier do app.
- **3.7** Crie uma chave de tipo *Array* chamada **URL Schemes** dentro de **Item 0**.
- **3.8** Crie uma chave de tipo *String* chamada **Item 0** dentro de **URL Schemes**.
- **3.9** Dê à *String* **Item 0** o valor do *AppID* da sua aplicação iOS do Facebook, com o prefixo **fb**.
**Exemplo**: 

```plist
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>fb289255557788943suffix</string>
            </array>
        </dict>
    </array>
```

Em caso de dúvidas, acesse as [instruções do próprio Facebook](https://developers.facebook.com/docs/ios/getting-started#xcode).

**OBS**: O *Bundle Identifier* do projeto deve estar cadastrado na sua aplicação iOS do Facebook.


#### Passo 4. Configurar o login com *Google* no arquivo *Info.plist* do seu projeto
- **4.1** Crie uma nova chave de tipo *Dictionary* (**Item 1**) dentro do *Array* **URL types**.
- **4.2** Crie uma chave de tipo *Array* chamada **URL Schemes** dentro de **Item 1**.
- **4.3** Crie uma chave de tipo *String* chamada **Item 0** dentro de **URL Schemes**.
- **4.4** Dê à *String* **Item 0** o valor da chave `REVERSED_CLIENT_ID` do arquivo `GoogleService-Info.plist`.
**Exemplo**: 

```plist
    <key>CFBundleURLTypes</key>
    <array>
        ...
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>com.googleusercontent.apps.445711035559-2g70f3qefpj67f3j2a36b0kulcfoblo9</string>
            </array>
        </dict>
    </array>
```


#### Passo 5. Configurar o *Keychain Sharing* para o *SSO (Single Sign On)* do *GloboID SDK*
- **5.1** Ativar o suporte a *Keychain Sharing* em *Capabilities* do projeto.
- **5.2** Definir *com.globo.globoid* em *Keychain Groups*.

![Keychain](https://github.com/globoi/globoid-sdk-ios/raw/master/resources/doc_keychain.png)

- **5.3** O arquivo *entitlements* será criado. No *Item 0*, digite *$(AppIdentifierPrefix)com.globo.globoid* caso não seja criado dessa forma.

![Entitlements](https://github.com/globoi/globoid-sdk-ios/raw/master/resources/doc_keychain_entitlements.png)


#### Passo 6. Configurar o *GloboID SDK* para *Firebase Cloud Messaging*
- **6.1** Adicione a chave `FirebaseAppDelegateProxyEnabled` no Info.plist com o valor `NO`
- **6.2** Adicione a chave `FirebaseAutomaticScreenReportingEnabled` no Info.plist com o valor `NO`
- **6.3** Configurar o AppDelegate de acordo com o item seguinte.

```plist
<key>FirebaseAppDelegateProxyEnabled</key>
	<false/>
<key>FirebaseAutomaticScreenReportingEnabled</key>
	<false/>
```


#### Passo 7. Configurar o *GloboID SDK* para *[Shared Web Credentials](https://developer.apple.com/documentation/security/shared_web_credentials)*
- **7.1** Ativar o suporte a *Associated Domains* em *Capabilities* do projeto.
- **7.2** Adicionar o domínio *webcredentials:login.globo.com* à lista de *domains*.
- **7.3** [Informar ao time GloboID](#contato) o identificador da sua aplicação para que o *Shared Web Credentials* seja configurado do lado do servidor. O identificador é composto pelo *Team ID* que publica o aplicativo seguido do *Bundle ID* do mesmo.


#### Passo 8. Configurar o *AppDelegate*
- **8.1** Importe o *GloboID SDK* no *AppDelegate.h*
```objc
@import GloboIDSDK;
```
- **8.2** Configure os métodos do *AppDelegate.m*

A inicialização da SDK deverá ser feita chamando o método `application:didFinishLaunchingWithOptions:appID:googleClientID:googleAppID:gcmSenderID:` da classe `GloboIDSDK`. O parâmetro `appID` deve receber o AppID definido na configuração para *Push Notifications*.

O parâmetro `googleClientID` deve receber o valor da chave `CLIENT_ID` do arquivo `GoogleService-Info.plist`.

O parâmetro `googleAppID` deve receber o valor da chave `GOOGLE_APP_ID` do arquivo `GoogleService-Info.plist`.

O parâmetro `gcmSenderID` deve receber o valor da chave `GCM_SENDER_ID` do arquivo `GoogleService-Info.plist`.

**Exemplo**: 
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [GloboIDSDK application:application 
    didFinishLaunchingWithOptions:launchOptions 
    appID:@"bundle-identifier-do-seu-app" 
    googleClientID:@"client-id-do-seu-app-no-firebase"
    googleAppID:@"app-id-do-seu-app-no-firebase",
    gcmSenderID:@"gcm-sender-id-do-seu-app-no-firebase"];
}
```

O método `application:openURL:options:` também deve ser declarado, mesmo que com implementação vazia.
```objc
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    // Mesmo com implementação vazia, este método deve estar presente no AppDelegate
    return NO;
} 
```

Caso sua aplicação dê suporte ao iOS 8, também é necessário implementar o seguinte método no seu *AppDelegate.m*:
```objc
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // Mesmo com implementação vazia, este método deve estar presente no AppDelegate
    return NO;
}
```

#### Passo 9. Configurar o *GloboID SDK* na *ViewController* do seu projeto
- **9.1** Importe o *GloboID SDK* no *ViewController.h* de onde você quer chamar o *GloboID SDK*.
```objc
@import GloboIDSDK;
```
- **9.2** Instancie o *GloboID SDK* no método *viewDidLoad()* do *ViewController.m*.
```objc
GloboIDSDK *globoIDSDK = [GloboIDSDK sharedManager];
globoIDSDK.delegate = self;
```
- **9.3** Chamar o método abaixo para iniciar o fluxo do *GloboID SDK*.
```objc
[[GloboIDSDK sharedManager] loginWithServiceID:@"6386" viewController:self];
```
- **9.4** Implemente os métodos do *GloboIDSDKDelegate* no *ViewController.m*.

```objc
- (void)globoUserDidLogin:(GloboUser *)globoUser;
- (void)globoUserDidCancelLogin;
- (void)loginDidFailWithViewController:(UIViewController *)viewController error:(NSError *)error;

- (void)globoUserWillLogout:(GloboUser *)globoUser;
- (void)globoUserDidLogout;
- (void)logoutDidFailWithError:(NSError *)error;

- (void)globoUser:(GloboUser *)globoUser hasBeenAuthorized:(BOOL)hasBeenAuthorized;
```


#### Exemplo de chamada ao *GloboID SDK*.
```objc
- (void)viewDidLoad {
    [super viewDidLoad];

    GloboIDSDK *globoIDSDK = [GloboIDSDK sharedManager];
    globoIDSDK.delegate = self;
}
```

```objc
- (IBAction)loginWithGloboIDSDK:(id)sender {
    [[GloboIDSDK sharedManager] isUserLoggedWithCompletion:^(BOOL isUserLogged, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }

        if (isUserLogged) {
            [[GloboIDSDK sharedManager] logout];
        } else {
            [[GloboIDSDK sharedManager] loginWithServiceID:@"6386" viewController:self];
        }
    }];
}
```
É possível também fazer uma chamada de login sem que seja oferecida a possibilidade de cadastro de uma nova conta ao usuário, utilizando o método `loginHiddingSignUpWithServiceID:viewController:`
```objc
- (IBAction)loginWithGloboIDSDK:(id)sender {
    [[GloboIDSDK sharedManager] loginHiddingSignUpWithServiceID:@"6386" viewController:self];
}
```

## Autenticação cross device

Há duas maneiras de ativar um dispositivo remotamente:

* 1 - Exibindo tela para usuário inserir o código de ativação que aparece no dispositivo remoto

```objc
[[GloboIDSDK sharedManager] activateRemoteDeviceWithServiceID:serviceID viewController:self];
```

* 2 - Detecção de devices automática

```objc
[[GloboIDSDK sharedManager] startRemoteDeviceDiscovery];
```

#### Parando o serviço de detecção automática

```objc
[[GloboIDSDK sharedManager] stopRemoteDeviceDiscovery];
```


## *Tracking* de usuários

A SDK fornece identificação de usuários logados e anônimos para recomendação e envio de sinais ao Horizon.

Para obter o tipo de usuário atual, utilize a propriedade `trackedUser` da classe `EventTracker`.

```swift
if let trackedUser = EventTracker.trackedUser {
    switch trackedUser.provider {
    case .cadun:
        print("Logged user glbid", trackedUser.id)
    case .anonymous:
        print("Anonymous user glb_uid", trackedUser.id)
    }
}
```


## Complemento de cadastro
É possivel solicitar ao usuário algumas informações extras após do cadastro, utilizando o seguinte método:
```swift
GloboIDSDK.sharedManager().requestMissingData(with: UIViewController!, user: GloboUser!, requiredData: Set<NSNumber>!, serviceID: String!, completion: ((Bool, Error?) -> Void)!)
```
A SDK abrirá uma tela para que o usuário preencha as informações passadas no `requiredData`. Essas informações são representadas pelo `enum` `UserData`, e os valores possíveis são:

    birthdate
    gender
    phone
    cpf
    address
    city
    facebook

O parâmetro `requiredData` é um `Set` de `NSNumber`s, onde cada `NSNumber` deve conter o `rawValue` de um valor de `UserData`.

O bloco de código `completion` é chamado informando se o usuário preencheu ou não as informações ou se ocorreu algum erro.

É possível também apenas verificar se alguma informação desejada está faltando, utilizando o seguinte método:
```swift
GloboIDSDK.sharedManager().checkMissingData(for: GloboUser!, requiredData: Set<NSNumber>!, completion: ((Bool, Error?) -> Void)!)
```
O bloco de código `completion` é chamado informando se existe alguma informação pendente e se ocorreu algum erro.


## Tracing de operações de usuários

É possível se registrar para receber avisos das operações executadas pelos usuários no SDK implementando o protocolo `GloboIDUserTracingDelegate`, que contempla as seguintes operações:

- `func willShowLogin(isFallback: Bool)`: Invocado ao exibir a tela de login, podendo ser pelo fluxo principal ou pelo fluxo alternativo (parâmetro `isFallback`).
- `func willShowSignUp(isFallback: Bool)`: Invocado ao exibir a tela de cadastro, podendo ser pelo fluxo principal ou pelo fluxo alternativo (parâmetro `isFallback`).
- `func willShowRestorePassword()`: Invocado ao exibir a tela de recuperação de senha.
- `func willShowProvisioning()`: Invocado ao exibir a tela de provisionamento (ex.: complemento de cadastro, informando data de nascimento do usuário).
- `func willShowPendingActivation()`: Invocado ao exibir a tela de confirmação de e-mail.
- `func willShowFacebookLogin()`: Invocado ao iniciar o fluxo de login com Facebook.
- `func willShowGoogleLogin()`: Invocado ao iniciar o fluxo de login com Google.
- `func willShowUseTerms()`: Invocado ao exibir a tela de termos de uso.
- `func willShowPrivacyPolicy()`: Invocado ao exibir a tela de políticas de privacidade.

Para inicializar o objeto responsável pelo tracing, é necessário invocar o método:

```objc
+ (BOOL)registerUserTracingDelegate:tracingDelegate:(id<GloboIDUserTracingDelegate>) tracingDelegate;

[[GloboIDSDK sharedManager] registerUserTracingDelegate:userTracingDelegate];
```

Para remover a referência do objeto de tracing do SDK, é necessário invocar o método:

```objc
+ (BOOL)unregisterUserTracingDelegate:tracingDelegate;

[[GloboIDSDK sharedManager] unregisterUserTracingDelegate];
```

## Atributos de usuários

É possível buscar e inserir/atualizar atributos de usuários utilizando o [globoID Attributes](http://docs.globoid.globoi.com/attributes) utilizando os seguintes métodos:
- `GloboIDSDK.sharedManager()?.getUserAttributes(completion: ([GloboIDUserAttribute]?, Error?) -> Void)`
- `GloboIDSDK.sharedManager()?.saveUserAttribute(withClientID: String, attribute: GloboIDUserAttribute, completion: (Error?) -> Void)`

Os métodos buscam o usuário logado para obter um `GLBID` válido para integração com a API de Atributos, portanto, é necessário que o usuário esteja autenticado.

Exemplos:

- Buscar atributos de usuário

```swift
    GloboIDSDK.sharedManager()?.getUserAttributes { attributes, error in
        guard let attributes = attributes, error == nil else {
            return
        }

        self.data = attributes
        self.tableView.reloadData()
    }
```

- Persistir atributos de usuário

```swift
    GloboIDSDK.sharedManager()?.saveUserAttribute(withClientID: "globoid-sdk", attribute: GloboIDUserAttribute(key: key, value: value)) { error in
        guard error == nil else {
            print(error)
            return
        }

        self.fetchAttributes()
    }
```

## Integração com Webview

É possível interceptar as chamadas de uma Webview que utilize cadun.js ou que autentique na web com GloboID (antigo Cadun).

#### UIWebview

Passos:

- Chamar [[GloboIDSDK sharedManager] interceptUIWebview:webView] em (void)webViewDidStartLoad:(UIWebView *)webView
- Interceptar as chamadas em webView:shouldStartLoadWithRequest:navigationType chamando: [[GloboIDSDK sharedManager] intercept:request viewController:self];
    - Este método retorna YES se houver interceptação

Exemplo:


```objc
- (void)viewDidLoad {
    NSLog(@"----------> %@ => %@", @"Interception View did loaded", self.webView);
    [super viewDidLoad];
    [self.webView setDelegate:self];

    NSURL *url = [NSURL URLWithString:kProductURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"----------> %@", @"webViewDidStartLoad");
    [[GloboIDSDK sharedManager] interceptUIWebview:webView];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    BOOL intercepted = [[GloboIDSDK sharedManager] intercept:request viewController:self];

    return !intercepted;
}
```

#### WKWebview

Passos:

- Chamar `[[GloboIDSDK sharedManager] interceptWKWebview:self.webView]` em (void)webViewDidStartLoad:(UIWebView *)webView
- Interceptar as chamadas em webView:shouldStartLoadWithRequest:navigationType chamando: [[GloboIDSDK sharedManager] intercept:request viewController:self];
    - Este método retorna YES se houver interceptação

```objc
- (void) viewDidLoad {
    NSLog(@"WKWebviewViewController viewDidLoad");

    NSURL *url = [NSURL URLWithString:kProductURL];

    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.webView.navigationDelegate = self;

    [[GloboIDSDK sharedManager] interceptWKWebview:self.webView];
    [self.webView loadRequest:[NSMutableURLRequest requestWithURL:url]];
    [self.container addSubview:self.webView];
}


-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    BOOL intercepted = [[GloboIDSDK sharedManager] intercept:navigationAction.request viewController:self];

    if (intercepted) {
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}
```

#### Gerenciando domínios

Por **padrão** a SDK **gerencia os cookies** de autenticação em URLs **no domínio .globo.com** (ou .globoi.com, dependendo do ambiente).

Mas é possível interceptar outros domínios. Veja o exemplo:

```objc
[[GloboIDSDK sharedManager] interceptWebviewForDomains: [NSSet setWithObjects:@".tectudo.com.br", @".receitas.com.br", nil]];
```


## Ambientes do *GloboID SDK*.

A SDK suporta mudança dinamica de ambientes:

- **PROD**: Ambiente de produção (_default_).
- **DEV**: Ambiente de desenvolvimento.
- **QA**: Ambiente de QA.
- **QA01**: Ambiente QA01.

Para alterar os ambientes, basta setar o environment da classe Globals, normalmente no AppDelegate

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    Globals.environment = Environment.QA
    ...
}
```

## Contato <a name="contato"></a>
**Globo.com** - globoid.mobile@corp.globo.com
