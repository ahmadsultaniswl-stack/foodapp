# FoodApp — Flutter UI Clone

A 5-screen UI clone of a food-delivery app, built for the **Flutter UI Clone**
mini project challenge (Appverse Technologies internship, Phase 1).

## Screens
1. **Splash** — animated logo intro
2. **Home** — search, category filter, responsive dish grid
3. **Food Detail** — hero image, quantity selector, related dishes, add to cart
4. **Cart** — cart list with quantity steppers, swipe to delete, subtotal
5. **Profile** — user info, dark/light mode toggle, account menu

## How the requirements are met
| Requirement | Where |
|---|---|
| Core widgets only | No UI package added; only `flutter/material.dart` |
| Custom reusable components | `lib/widgets/` — `CustomButton`, `FoodCard`, `CategoryChip`, `SectionTitle`, `CartItemTile` |
| Build methods under 50 lines | Every screen splits its `build()` into small `_buildXxx()` helper methods |
| Responsive layout | `HomeScreen` uses `MediaQuery` for adaptive padding and `LayoutBuilder` to change grid columns (2/3/4) by width |
| Smooth page transitions | `lib/utils/page_transitions.dart` — `FadeSlideRoute`, used for every screen push |
| Dark/light mode toggle | `ThemeScope` + switch in `ProfileScreen`, backed by `ValueNotifier<ThemeMode>` |

State (cart + theme) is handled with plain Flutter `ChangeNotifier` /
`ValueNotifier` wrapped in `InheritedNotifier`, so no external state
management package is required.

## Getting started
```bash
flutter pub get
flutter run
```

To run the included smoke test:
```bash
flutter test
```

## For the submission report/demo
- Take screenshots of all 5 screens in **both** light and dark mode.
- Record the demo showing: splash → home (search + filter) → tapping a
  dish → adjusting quantity → add to cart → cart screen (increment/
  decrement/swipe to delete) → profile → toggling dark mode.
- Component structure section of the report can reference the table above
  and the `lib/` folder layout:
  ```
  lib/
    main.dart
    theme/        # light & dark ThemeData
    state/        # CartModel, CartScope, ThemeScope
    models/       # FoodItem
    data/         # dummy menu data
    utils/        # FadeSlideRoute
    widgets/      # reusable UI components
    screens/      # the 5 screens
  ```
