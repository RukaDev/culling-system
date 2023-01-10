import Link from "@docusaurus/Link";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
import clsx from "clsx";
import React from "react";
import "./home.css";
import styles from "./index.module.css";

const FEATURES = [
  {

  },
  {
  
  },
  {

  },
];

function Feature({ image, title, description, Art }) {
  return (
    <div className={styles.feature}>
      {image && <img className={styles.featureSvg} alt={title} src={image} />}
      {Art && <Art className={styles.featureSvg} />}
      <div className={styles.featureDescription}>
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export function HomepageFeatures() {
  if (!FEATURES) return null;

  return (
    <section>
      <div className="container">
        <div className={styles.features}>
          {FEATURES.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header className={clsx("hero", styles.heroBanner)}>
      <div className="container">
        <h1 className="hero__title">
          <img
            src={require('@site/static/img/cyclone-trans.png').default}
            className="bigLogo"
            alt="Moonwave"
          />
        </h1>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/docs/intro"
          >
            Get Started →
          </Link>
        </div>
      </div>
    </header>
  );
}

export default function Home() {
  const { siteConfig, tagline } = useDocusaurusContext();
  return (
    <Layout title={siteConfig.title} description={tagline}>
      <HomepageHeader />
      <main>

        <HomepageFeatures />
      </main>
    </Layout>
  );
}