import 'package:flutter/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// Enum utilizado para manejar la navegacion de PRAppBAr
enum MenuDeOpciones {
  // --- Crear contenido ---
  createReport,
  yourArticles,
  // --- Distribucion del contenido ---
  projects,
  dashboards,
  // --- Opciones ---
  helpCenter,
  contactSupport,
  prLabWeb,
  prLabNewsroom,
  productUpdate,
  // --- Configuraciones ---
  accountSettings,
  payments,
  users,
  emailSetup,
  activityHistory,
  // --- Perfil ---
  profile,
  changeAccount,
  signOut,

  // --- Cobertura de medios de comunicación --
  databaseMedia;

  /// Retorna el nombre de la categoría.
  String nombreItem(BuildContext context) {
    return switch (this) {
      createReport => context.l10n.prAppBarCreateContentCreateReport,
      yourArticles => context.l10n.prAppBarCreateContentYourArticles,
      projects => context.l10n.prAppBarDistributionContentProjects,
      dashboards => context.l10n.prAppBarDistributionContentDashboards,
      helpCenter => context.l10n.prAppBarOptionsHelpCenter,
      contactSupport => context.l10n.prAppBarOptionsContactSupport,
      prLabWeb => context.l10n.prAppBarOptionsPRLabWeb,
      prLabNewsroom => context.l10n.prAppBarOptionsPRLabNewsroom,
      productUpdate => context.l10n.prAppBarOptionsProductUpdates,
      accountSettings => context.l10n.prAppBarSettingsAccountSettigns,
      payments => context.l10n.prAppBarSettingsPayments,
      users => context.l10n.prAppBarSettingsUsers,
      emailSetup => context.l10n.prAppBarSettingsEmailSetup,
      activityHistory => context.l10n.prAppBarSettingsActivityHistory,
      profile => context.l10n.prAppBarProfile,
      changeAccount => context.l10n.prAppBarProfileChangeAccount,
      signOut => context.l10n.prAppBarProfileSignOut,
      databaseMedia => context.l10n.prAppBarCoverageMediaDbMedia,
    };
  }

  /// Listas de items para diferenciar la sección 'Crear contenido'
  static List<MenuDeOpciones> get crearContenido => [
        createReport,
        yourArticles,
      ];

  /// Listas de items para diferenciar la sección 'Distribucion de contenido'
  static List<MenuDeOpciones> get distribucionDeContenido => [
        projects,
        dashboards,
      ];

  /// Listas de items para diferenciar la sección 'Opciones'
  static List<MenuDeOpciones> get opciones => [
        helpCenter,
        contactSupport,
        prLabWeb,
        prLabNewsroom,
        productUpdate,
      ];

  /// Listas de items para diferenciar la sección 'Configuraciones'
  static List<MenuDeOpciones> get configuraciones => [
        accountSettings,
        payments,
        users,
        emailSetup,
        activityHistory,
      ];

  /// Listas de items para diferenciar la sección 'Perfil'
  static List<MenuDeOpciones> get perfil => [
        profile,
        changeAccount,
        signOut,
      ];

  /// Listas de items para diferenciar la sección
  /// 'Cobertura de medios de comunicación'.
  static List<MenuDeOpciones> get coberturaMedia => [
        databaseMedia,
      ];

  bool get esHelpCenter => this == helpCenter;
  bool get eContactSupport => this == contactSupport;
  bool get esPrLabWeb => this == prLabWeb;
  bool get esPrLabNewsroom => this == prLabNewsroom;
  bool get esProductUpdate => this == productUpdate;
  bool get esAccountSettings => this == accountSettings;
  bool get esPayments => this == payments;
  bool get esUsers => this == users;
  bool get esEmailSetup => this == emailSetup;
  bool get esActivityHistory => this == activityHistory;
  bool get esProfile => this == profile;
  bool get esChangeAccount => this == changeAccount;
  bool get esSignOut => this == signOut;
  bool get esCreateReport => this == createReport;
  bool get esYourArticles => this == yourArticles;
  bool get esProjects => this == projects;
  bool get esDashboards => this == dashboards;
  bool get esMediaDatabase => this == databaseMedia;
}
