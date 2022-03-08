*** Settings ***
Documentation  Mapeamento dos elementos da tela de login.

*** Variables ***
${loginWelcomeText}  Olá, vamos testar o Login?
${baseLocator}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]

${loginInput}        ${baseLocator}/android.view.ViewGroup[1]/android.widget.EditText
${passwordInput}     ${baseLocator}/android.view.ViewGroup[2]/android.widget.EditText
${submitBtn}         ${baseLocator}/android.view.ViewGroup[3]

# Alert
&{alertText}  locator=id=android:id/alertTitle  text=Usuario e/ou senha incorreto
${alertBtn}   id=android:id/button1