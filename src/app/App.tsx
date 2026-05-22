import { Github, Linkedin, Mail, ExternalLink } from 'lucide-react';
import { ImageWithFallback } from './components/figma/ImageWithFallback';
import { motion } from 'motion/react';
import profileData from '../data/profile.json';

const iconMap = {
  github: Github,
  linkedin: Linkedin,
  mail: Mail,
};

function resolveImageSource(src: string) {
  if (
    src.startsWith('http://') ||
    src.startsWith('https://') ||
    src.startsWith('data:') ||
    src.startsWith('/')
  ) {
    return src;
  }

  return new URL(`../data/${src}`, import.meta.url).href;
}

function renderAboutSection(section: any, fadeIn: any) {
  return (
    <section className="mb-16">
      <motion.h2 className="mb-4" {...fadeIn}>{section.title}</motion.h2>
      <motion.div className="space-y-4 text-foreground/80 leading-relaxed" {...fadeIn}>
        {section.paragraphs.map((paragraph: string, index: number) => (
          <p key={`${paragraph.slice(0, 40)}-${index}`}>{paragraph}</p>
        ))}
      </motion.div>
    </section>
  );
}

function renderSkillsSection(section: any, fadeIn: any) {
  return (
    <section className="mb-16">
      <motion.h2 className="mb-6" {...fadeIn}>{section.title}</motion.h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {section.groups.map((group: any) => (
          <motion.div key={group.name} {...fadeIn}>
            <h3 className="mb-3">{group.name}</h3>
            <div className="flex flex-wrap gap-2">
              {group.items.map((item: string) => (
                <span key={item} className="px-3 py-1 bg-secondary text-secondary-foreground rounded-md">
                  {item}
                </span>
              ))}
            </div>
          </motion.div>
        ))}
      </div>
    </section>
  );
}

function renderTimelineSection(section: any, fadeIn: any) {
  return (
    <section className="mb-16">
      <motion.h2 className="mb-6" {...fadeIn}>{section.title}</motion.h2>
      <div className="space-y-8">
        {section.items.map((item: any, index: number) => (
          <motion.div key={item.role ?? item.school ?? item.title ?? index} className="border-l-2 border-border pl-6" {...fadeIn}>
            <div className="flex justify-between items-start gap-4 mb-2">
              <div>
                <h3>{item.role ?? item.school ?? item.title}</h3>
                {(item.company || item.degree || item.subtitle) && (
                  <p className="text-muted-foreground">{item.company ?? item.degree ?? item.subtitle}</p>
                )}
              </div>
              {item.period && (
                <span className="text-muted-foreground whitespace-nowrap">{item.period}</span>
              )}
            </div>
            {Array.isArray(item.highlights) && (
              <ul className="list-disc list-inside text-foreground/80 space-y-1 mt-3">
                {item.highlights.map((highlight: string) => (
                  <li key={highlight}>{highlight}</li>
                ))}
              </ul>
            )}
            {item.description && (
              <p className="text-foreground/80 mt-3">{item.description}</p>
            )}
          </motion.div>
        ))}
      </div>
    </section>
  );
}

function renderProjectsSection(section: any, fadeIn: any) {
  return (
    <section className="mb-16">
      <motion.h2 className="mb-6" {...fadeIn}>{section.title}</motion.h2>
      <div className="grid gap-6">
        {section.items.map((item: any, index: number) => (
          <motion.div
            key={item.name ?? item.title ?? index}
            className="border border-border rounded-lg p-6 hover:border-foreground/20 transition-colors"
            {...fadeIn}
          >
            <div className="mb-3">
              <h3>{item.name ?? item.title}</h3>
            </div>
            {Array.isArray(item.description) && (
              <p className="text-foreground/80 mb-3">
                {item.description.join(' ')}
              </p>
            )}
            {Array.isArray(item.techStack) && (
              <div className="flex flex-wrap gap-2">
                {item.techStack.map((tech: string) => (
                  <span key={tech} className="px-2 py-1 bg-accent text-accent-foreground rounded text-sm">
                    {tech}
                  </span>
                ))}
              </div>
            )}
          </motion.div>
        ))}
      </div>
    </section>
  );
}

function renderPublicationsSection(section: any, fadeIn: any) {
  return (
    <section className="mb-16">
      <motion.h2 className="mb-6" {...fadeIn}>{section.title}</motion.h2>
      <div className="space-y-6">
        {section.items.map((item: any, index: number) => (
          <motion.div key={item.title ?? index} className="border-l-2 border-border pl-6" {...fadeIn}>
            <div className="flex justify-between items-start gap-4 mb-2">
              <h3>{item.title}</h3>
              {item.link && item.link !== '#' && (
                <a href={item.link} className="text-muted-foreground hover:text-foreground transition-colors shrink-0">
                  <ExternalLink className="w-5 h-5" />
                </a>
              )}
            </div>
            {item.authors && <p className="text-foreground/80 mb-1">{item.authors}</p>}
            {item.venue && <p className="text-muted-foreground text-sm mb-2">{item.venue}</p>}
            {item.summary && <p className="text-foreground/70 text-sm">{item.summary}</p>}
          </motion.div>
        ))}
      </div>
    </section>
  );
}

function renderContactSection(section: any, fadeIn: any) {
  return (
    <section className="mb-16">
      <motion.h2 className="mb-6" {...fadeIn}>{section.title}</motion.h2>
      <div className="space-y-3">
        {section.items.map((item: any, index: number) => {
          const Icon = iconMap[item.type as keyof typeof iconMap] ?? Mail;

          return (
            <motion.div key={`${item.type ?? 'contact'}-${item.label ?? index}`} className="flex items-center gap-3" {...fadeIn}>
              <Icon className="w-5 h-5 text-muted-foreground" />
              <a href={item.url} className="text-foreground hover:underline">
                {item.label ?? item.url}
              </a>
            </motion.div>
          );
        })}
      </div>
    </section>
  );
}

function renderListSection(section: any, fadeIn: any) {
  return (
    <section className="mb-16">
      <motion.h2 className="mb-6" {...fadeIn}>{section.title}</motion.h2>
      <div className="space-y-4">
        {section.items.map((item: any, index: number) => (
          <motion.div key={item.title ?? item.name ?? index} className="border border-border rounded-lg p-6" {...fadeIn}>
            {Object.entries(item).map(([key, value]) => (
              <p key={key} className="text-foreground/80">
                <span className="font-medium text-foreground capitalize">{key}: </span>
                {Array.isArray(value) ? value.join(', ') : String(value)}
              </p>
            ))}
          </motion.div>
        ))}
      </div>
    </section>
  );
}

function renderSection(section: any, fadeIn: any) {
  if (Array.isArray(section.paragraphs)) {
    return renderAboutSection(section, fadeIn);
  }

  if (Array.isArray(section.groups)) {
    return renderSkillsSection(section, fadeIn);
  }

  if (
    Array.isArray(section.items) &&
    section.items.every((item: any) => item.type && item.url)
  ) {
    return renderContactSection(section, fadeIn);
  }

  if (
    Array.isArray(section.items) &&
    section.items.every((item: any) => item.authors || item.venue || item.summary)
  ) {
    return renderPublicationsSection(section, fadeIn);
  }

  if (
    Array.isArray(section.items) &&
    section.items.every((item: any) => Array.isArray(item.techStack))
  ) {
    return renderProjectsSection(section, fadeIn);
  }

  if (
    Array.isArray(section.items) &&
    section.items.every((item: any) =>
      item.role || item.company || item.highlights || item.school || item.degree || item.period
    )
  ) {
    return renderTimelineSection(section, fadeIn);
  }

  if (Array.isArray(section.items)) {
    return renderListSection(section, fadeIn);
  }

  return null;
}

export default function App() {
  const profile = profileData;
  const fadeIn = {
    initial: { opacity: 0 },
    whileInView: { opacity: 1 },
    viewport: { once: false, margin: "-50px" },
    transition: { duration: 0.5, ease: "easeOut" }
  };

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b border-border">
        <div className="max-w-4xl mx-auto px-6 py-8">
          <div className="flex justify-between items-start gap-8">
            <div className="flex-1">
              <h1 className="mb-2">{profile.header.name}</h1>
              <p className="text-muted-foreground mb-4">{profile.header.title}</p>
              <div className="flex gap-4">
                {profile.header.socialLinks.map((link) => {
                  const Icon = iconMap[link.type];

                  return (
                    <a
                      key={`${link.type}-${link.url}`}
                      href={link.url}
                      className="text-foreground hover:text-muted-foreground transition-colors"
                    >
                      <Icon className="w-5 h-5" />
                    </a>
                  );
                })}
              </div>
            </div>
            <ImageWithFallback
              src={resolveImageSource(profile.header.profileImage.src)}
              alt={profile.header.profileImage.alt}
              className="w-32 h-32 rounded-full object-cover border-2 border-border"
            />
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-4xl mx-auto px-6 py-12">
        {Object.entries(profile.sections).map(([sectionKey, section]) => (
          <div key={sectionKey}>
            {renderSection(section, fadeIn)}
          </div>
        ))}
      </main>

      {/* Footer */}
      <footer className="border-t border-border mt-16">
        <div className="max-w-4xl mx-auto px-6 py-8 text-center text-muted-foreground">
          <p>{profile.footer.copyright}</p>
        </div>
      </footer>
    </div>
  );
}
