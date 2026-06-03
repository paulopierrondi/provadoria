#!/usr/bin/env python3
import re

pbxproj_path = "/Users/paulopierrondi/Projects/provadoria/ios/ProvadorIA.xcodeproj/project.pbxproj"

with open(pbxproj_path, "r") as f:
    content = f.read()

# Files to remove
files_to_remove = [
    "EmptyStateView.swift",
    "ErrorStateView.swift",
    "OnboardingView.swift",
    "ShareSheet.swift",
    "ShimmerLoadingView.swift"
]

# Remove PBXBuildFile lines
for filename in files_to_remove:
    pattern = r'\t\t[0-9A-F]+ /\* ' + re.escape(filename) + r' in Sources \*/ = \{isa = PBXBuildFile; fileRef = [0-9A-F]+ /\* ' + re.escape(filename) + r' \*/; \};\n'
    content = re.sub(pattern, '', content)

# Remove PBXFileReference lines
for filename in files_to_remove:
    pattern = r'\t\t[0-9A-F]+ /\* ' + re.escape(filename) + r' \*/ = \{isa = PBXFileReference; lastKnownFileType = sourcecode\.swift; path = ' + re.escape(filename) + r'; sourceTree = "<group>"; \};\n'
    content = re.sub(pattern, '', content)

# Remove from group children
for filename in files_to_remove:
    pattern = r'\t\t\t\t[0-9A-F]+ /\* ' + re.escape(filename) + r' \*/,\n'
    content = re.sub(pattern, '', content)

# Remove from PBXSourcesBuildPhase
for filename in files_to_remove:
    pattern = r'\t\t\t\t[0-9A-F]+ /\* ' + re.escape(filename) + r' in Sources \*/,\n'
    content = re.sub(pattern, '', content)

with open(pbxproj_path, "w") as f:
    f.write(content)

print("pbxproj cleaned up")
