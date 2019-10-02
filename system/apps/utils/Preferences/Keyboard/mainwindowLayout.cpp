m_pcRoot = new os::VLayoutNode( "Root" );
m_pcVRoot = new os::VLayoutNode( "VRoot", 1.000000 );
m_pcVRoot->SetBorders( os::Rect( 0.000000, 0.000000, 0.000000, 0.000000 ) );
m_pcRoot->AddChild( m_pcVRoot );
m_pcTabView = new os::TabView( os::Rect(), "TabView" );
m_pcKeyboardTab = new os::LayoutView( os::Rect(), "KeyboardTab" );
m_pcKeyboardLayout = new os::VLayoutNode( "KeyboardLayout" );
m_pcTabView->AppendTab(  MSG_MAINWND_KEYMAP, m_pcKeyboardTab );
m_pcSettingsTab = new os::LayoutView( os::Rect(), "SettingsTab" );
m_pcSettingsLayout = new os::VLayoutNode( "SettingsLayout" );
m_pcTabView->AppendTab(  MSG_MAINWND_SETTINGS, m_pcSettingsTab );
m_pcVRoot->AddChild( m_pcTabView, 1.000000 );
m_pcKeyboard = new os::VLayoutNode( "Keyboard", 1.000000 );
m_pcKeyboard->SetBorders( os::Rect( 5.000000, 5.000000, 5.000000, 5.000000 ) );
m_pcKeyboardLayout->AddChild( m_pcKeyboard );
m_pcKeyboardLayoutFrame = new os::FrameView( os::Rect(), "KeyboardLayoutFrame", MSG_MAINWND_KEYBOARDLAYOUT );
m_pcKeyboardLayoutFrameLayout = new os::VLayoutNode( "KeyboardLayoutFrameLayout" );
m_pcKeyboardLayoutFrameLayout->SetBorders( os::Rect( 5.000000, 5.000000, 5.000000, 5.000000 ) );
m_pcKeyboard->AddChild( m_pcKeyboardLayoutFrame, 1.000000 );
m_pcKeyboardLayoutShowAll = new os::CheckBox( os::Rect(), "KeyboardLayoutShowAll", MSG_MAINWND_KEYBOARDLAYOUT_SHOWALL, new os::Message( M_SHOWALL ) );
m_pcKeyboardLayoutShowAll->SetValue( false );
m_pcKeyboardLayoutFrameLayout->AddChild( m_pcKeyboardLayoutShowAll, 0.010000 );
m_pcKeyboardLayoutSpacer = new os::VLayoutSpacer( "KeyboardLayoutSpacer", 5.000000, 5.000000, NULL, 1.000000 );
m_pcKeyboardLayoutFrameLayout->AddChild( m_pcKeyboardLayoutSpacer );
m_pcKeyboardLayoutList = new os::ListView( os::Rect(), "KeyboardLayoutList", os::ListView::F_RENDER_BORDER | os::ListView::F_NO_HEADER );
m_pcKeyboardLayoutFrameLayout->AddChild( m_pcKeyboardLayoutList, 1.000000 );
m_pcKeyboardLayoutFrame->SetRoot( m_pcKeyboardLayoutFrameLayout );
m_pcKeyboardSpacer = new os::VLayoutSpacer( "KeyboardSpacer", 10.000000, 10.000000, NULL, 1.000000 );
m_pcKeyboard->AddChild( m_pcKeyboardSpacer );
m_pcTestAreaFrame = new os::FrameView( os::Rect(), "TestAreaFrame", MSG_MAINWND_TESTAREA );
m_pcTestAreaFrameLayout = new os::VLayoutNode( "TestAreaFrameLayout" );
m_pcTestAreaFrameLayout->SetBorders( os::Rect( 5.000000, 5.000000, 5.000000, 5.000000 ) );
m_pcKeyboard->AddChild( m_pcTestAreaFrame, 1.000000 );
m_pcTestAreaView = new os::TextView( os::Rect(), "TestAreaView", "" );
m_pcTestAreaFrameLayout->AddChild( m_pcTestAreaView, 1.000000 );
m_pcTestAreaFrame->SetRoot( m_pcTestAreaFrameLayout );
m_pcSettings = new os::VLayoutNode( "Settings", 1.000000 );
m_pcSettings->SetBorders( os::Rect( 5.000000, 5.000000, 5.000000, 5.000000 ) );
m_pcSettingsLayout->AddChild( m_pcSettings );
m_pcSettingsFrame = new os::FrameView( os::Rect(), "SettingsFrame", MSG_MAINWND_SETTINGS_SETTINGS );
m_pcSettingsFrameLayout = new os::VLayoutNode( "SettingsFrameLayout" );
m_pcSettingsFrameLayout->SetBorders( os::Rect( 5.000000, 5.000000, 5.000000, 5.000000 ) );
m_pcSettings->AddChild( m_pcSettingsFrame, 1.000000 );
m_pcInitialDelay = new os::HLayoutNode( "InitialDelay", 2.000000 );
m_pcInitialDelay->SetBorders( os::Rect( 0.000000, 0.000000, 0.000000, 0.000000 ) );
m_pcSettingsFrameLayout->AddChild( m_pcInitialDelay );
m_pcInitialLabel = new os::StringView( os::Rect(), "InitialLabel", MSG_MAINWND_SETTINGS_INITIALDELAY );
m_pcInitialDelay->AddChild( m_pcInitialLabel, 1.000000 );
m_pcInitialSpacer = new os::HLayoutSpacer( "InitialSpacer", 0.000000, 100000.000000, NULL, 1.000000 );
m_pcInitialDelay->AddChild( m_pcInitialSpacer );
m_pcInitialSlider = new os::Slider( os::Rect(), "InitialSlider", new os::Message( M_INITIALDELAY ), os::Slider::TICKS_BELOW, 10, os::Slider::KNOB_SQUARE, os::HORIZONTAL );
m_pcInitialSlider->SetStepCount( 11 );
m_pcInitialSlider->SetTickCount( 11 );
m_pcInitialSlider->SetLimitLabels( MSG_MAINWND_SETTINGS_INITIALDELAY_SHORT, MSG_MAINWND_SETTINGS_INITIALDELAY_LONG );
m_pcInitialSlider->SetMinMax( 0.000000, 1000.000000 );
m_pcInitialSlider->SetProgStrFormat(MSG_MAINWND_SETTINGS_MILISECONDS.c_str());
m_pcInitialDelay->AddChild( m_pcInitialSlider, 2.000000 );
/* m_pcInitialDelay->SameWidth( "InitialLabel", "InitialSlider", NULL ); */
m_pcRepeatDelay = new os::HLayoutNode( "RepeatDelay", 1.000000 );
m_pcRepeatDelay->SetBorders( os::Rect( 0.000000, 0.000000, 0.000000, 0.000000 ) );
m_pcSettingsFrameLayout->AddChild( m_pcRepeatDelay );
m_pcRepeatLabel = new os::StringView( os::Rect(), "RepeatLabel", MSG_MAINWND_SETTINGS_REPEATDELAY );
m_pcRepeatDelay->AddChild( m_pcRepeatLabel, 1.000000 );
m_pcRepeatSpacer = new os::HLayoutSpacer( "RepeatSpacer", 0.000000, 100000.000000, NULL, 1.000000 );
m_pcRepeatDelay->AddChild( m_pcRepeatSpacer );
m_pcRepeatSlider = new os::Slider( os::Rect(), "RepeatSlider", new os::Message( M_REPEATDELAY ), os::Slider::TICKS_BELOW, 10, os::Slider::KNOB_SQUARE, os::HORIZONTAL );
m_pcRepeatSlider->SetStepCount( 11 );
m_pcRepeatSlider->SetTickCount( 11 );
m_pcRepeatSlider->SetLimitLabels( MSG_MAINWND_SETTINGS_REPEATDELAY_FAST, MSG_MAINWND_SETTINGS_REPEATDELAY_SLOW );
m_pcRepeatSlider->SetProgStrFormat(MSG_MAINWND_SETTINGS_MILISECONDS.c_str());
m_pcRepeatSlider->SetMinMax( 0.000000, 200.000000 );
m_pcRepeatDelay->AddChild( m_pcRepeatSlider, 2.000000 );
/* m_pcRepeatDelay->SameWidth( "RepeatLabel", "RepeatSlider", NULL ); */
m_pcSettingsFrame->SetRoot( m_pcSettingsFrameLayout );
m_pcKeyboardTab->SetRoot( m_pcKeyboardLayout );
m_pcSettingsTab->SetRoot( m_pcSettingsLayout );
m_pcButtons = new os::HLayoutNode( "Buttons", 0.010000 );
m_pcButtons->SetBorders( os::Rect( 5.000000, 5.000000, 5.000000, 5.000000 ) );
m_pcVRoot->AddChild( m_pcButtons );
m_pcButtonSpacer1 = new os::HLayoutSpacer( "ButtonSpacer1", 100.000000, 100.000000, NULL, 1.000000 );
m_pcButtons->AddChild( m_pcButtonSpacer1 );
m_pcButtonApply = new os::Button( os::Rect(), "ButtonApply", MSG_MAINWND_BUTTON_APPLY, new os::Message( M_BUTTON_APPLY ) );
m_pcButtons->AddChild( m_pcButtonApply, 1.000000 );
m_pcButtonSpacer2 = new os::HLayoutSpacer( "ButtonSpacer2", 5.000000, 5.000000, NULL, 1.000000 );
m_pcButtons->AddChild( m_pcButtonSpacer2 );
m_pcButtonUndo = new os::Button( os::Rect(), "ButtonUndo", MSG_MAINWND_BUTTON_UNDO, new os::Message( M_BUTTON_UNDO ) );
m_pcButtons->AddChild( m_pcButtonUndo, 1.000000 );
m_pcButtonSpacer3 = new os::HLayoutSpacer( "ButtonSpacer3", 5.000000, 5.000000, NULL, 1.000000 );
m_pcButtons->AddChild( m_pcButtonSpacer3 );
m_pcButtonDefault = new os::Button( os::Rect(), "ButtonDefault", MSG_MAINWND_BUTTON_DEFAULT, new os::Message( M_BUTTON_DEFAULT ) );
m_pcButtons->AddChild( m_pcButtonDefault, 1.000000 );