---
title: Diversity_Entropy
date: 2023-03-08 22:06:00
---

{% raw %}

  <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">散度熵(Diversity Entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="diversity-entropy">
<h1>散度熵(Diversity Entropy)<a class="headerlink" href="#diversity-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>有长度为 <span class="math notranslate nohighlight">\(N\)</span>  的时间序列  <span class="math notranslate nohighlight">\(X = \left\{ {{x_1}, \cdots ,{x_i}, \cdots ,{x_N}} \right\}\)</span>，散度熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>将原始序列相空间重构为一系列的向量 <span class="math notranslate nohighlight">\({y_i}\left( m \right) = \left\{ {{x_i},{x_{i + 1}}, \cdots ,{x_{i + m - 1}}} \right\}\)</span> ，嵌入维度为 <span class="math notranslate nohighlight">\(m\)</span>  ，得到如下的相空间:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[Y\left( m \right) = \left\{ {{y_1}\left( m \right),{y_2}\left( m \right), \cdots ,{y_{N - m + 1}}\left( m \right)} \right\} \tag{1}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p><span class="math notranslate nohighlight">\({y_{N - M + 1}}\left( m \right)={\left\{ {{x_m},{x_{m + 1}}, \cdots , \cdots ,{x_N}} \right\}^T}\)</span> 均为列向量，<span class="math notranslate nohighlight">\(Y\left( m \right)\)</span> 构成 <span class="math notranslate nohighlight">\((N - m,m)\)</span> 维矩阵。</p>
</div>
<ol class="arabic simple" start="2">
<li><p>计算相邻向量之间的余弦相似度，得到一系列的余弦相似度 ，余弦相似度的计算如下：</p></li>
</ol>
<div class="math notranslate nohighlight">
\[D\left( m \right) = \left\{ {{d_1}, \cdots ,{d_{N - m}}} \right\} = \left\{ {d\left( {{y_1}\left( m \right),{y_2}\left( m \right)} \right), \cdots ,d\left( {{y_{N - m}}\left( m \right),{y_{N - m + 1}}\left( m \right)} \right)} \right\} \tag{2}\]</div>
<div class="math notranslate nohighlight">
\[d\left( {{y_i}\left( m \right),{y_j}\left( m \right)} \right) = \frac{{\sum\limits_{k = 1}^m {{y_i}\left( k \right) \times {y_j}\left( k \right)} }}{{\sqrt {\sum\limits_{k = 1}^m {{y_i}{{\left( k \right)}^2}} }  \times \sqrt {\sum\limits_{k = 1}^m {{y_j}{{\left( k \right)}^2}} } }} \tag{3}\]</div>
<ol class="arabic simple" start="3">
<li><p>余弦相似度的范围为 <span class="math notranslate nohighlight">\(\left[ { - 1,1} \right]\)</span> ，将 <span class="math notranslate nohighlight">\(\left[ { - 1,1} \right]\)</span>  分为 <span class="math notranslate nohighlight">\(\varepsilon\)</span> 个子区间 <span class="math notranslate nohighlight">\(\left( {{I_1},{I_2}, \cdots ,{I_\varepsilon }} \right)\)</span>  。然后将所有余弦相似度划分到子区间中，统计落入每个子区间的概率 <span class="math notranslate nohighlight">\(\left( {{P_1},{P_2}, \cdots ,{P_\varepsilon }} \right)\)</span> 。</p></li>
<li><p>DE可以被定义为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[DE\left( {m,\varepsilon ,N} \right) =  - \frac{1}{{\ln \varepsilon }}\sum\limits_{k = 1}^\varepsilon  {{P_k}\ln {P_k}}   \tag{4}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>散度熵是由Wang等人 <a class="footnote-reference brackets" href="#id9" id="id2">1</a>，提出的，建议的参数选择为：</p>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m = 4\)</span>  ,</p></li>
<li><p>符号数  <span class="math notranslate nohighlight">\(\varepsilon  = 30 \sim 100\)</span>  ,在后续的仿真验证中，我们选择  <span class="math notranslate nohighlight">\(m = 4\)</span> ，<span class="math notranslate nohighlight">\(\varepsilon=30\)</span>  。</p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>代码实现<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到  <a class="reference internal" href="../install.html"><span class="doc">安装说明</span></a></p>
<p>模糊熵(Fuzzy entropy)的核心程序为  <code class="docutils literal notranslate"><span class="pre">MultiDispEn</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span>function [MDE]=MultiDispEn(data,m,nc,tau,scale)

    MDE=[];
    data=data&#39;;
    for j=1:scale
        Xs = Multi(data,j,1);
        [de]=DisEn_NCDF(Xs&#39;,m,nc,tau);
        MDE=[MDE,de];
    end
end
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>各输入参数的信息如下：</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>：输入的时间序列，为列向量</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> :嵌入维度</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">nc</span></code>  : 类别数目</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">tau</span></code> :时间差</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code> :尺度比</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>仿真验证<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>散度熵的脉冲检测结果<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="散度熵的脉冲检测结果" src="/assets/Downloads/单尺度脉冲检测结果/DivEn.emf.svg" />
</figure>
</section>
<section id="id6">
<h3>多尺度散度熵的故障分类可视化结果<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度散度熵的故障分类可视化结果" src="/assets/Downloads/多尺度可视化结果/MultiDivEn.emf.svg" />
</figure>
</section>
<section id="id7">
<h3>抗噪性分析<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="抗噪性分析" src="/assets/Downloads/抗噪性结果/DivEn.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>计算效率结果<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="计算效率结果" src="/assets/Downloads/计算效率结果/DivEn.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="24">
<li><p>Wang, S. Si, and Y. Li, “Multiscale Diversity Entropy: A Novel Dynamical Measure for Fault Diagnosis of Rotating Machinery,” IEEE Trans. Ind. Inform., vol. 17, no. 8, pp. 5419–5429, Aug. 2021, doi: 10.1109/TII.2020.3022369.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="4%20Permutation%20Entropy.html" class="btn btn-neutral float-left" title="排列熵(Permutation Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="6%20Distribution%20Entropy.html" class="btn btn-neutral float-right" title="分布熵(Distribution Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  <
</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
