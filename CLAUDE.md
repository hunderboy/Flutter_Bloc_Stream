# Project Overview

This project is for practicing and studying Flutter's Bloc pattern.

# Code Style Guidelines

- This project is small but treat it as if it will scale. Always suggest production-quality code patterns used in real-world Flutter projects.
- Follow the structure and conventions used by [bloc library official examples](https://bloclibrary.dev) and very_good_ventures style guides.
- Use barrel files (`feature.dart`) to encapsulate each feature's public API.
- Separate concerns strictly: UI, Bloc/Cubit, and data layers must not bleed into each other.
- Prefer `Cubit` for simple state, `Bloc` for event-driven complex state.
- Always use `const` constructors where possible.
- Name files and classes clearly by responsibility (e.g., `counter_cubit.dart`, `counter_page.dart`, `counter_view.dart`).
